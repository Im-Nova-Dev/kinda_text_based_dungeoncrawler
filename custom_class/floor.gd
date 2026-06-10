extends Resource
class_name floor_res

var f_name: String = ""
var f_difficulty_point: int = 0
var generation_seed: int = -1

var f_rooms: Array[room_res] = []



# Generate rooms:
#   Inputs: total_points (budget), d_seed (-1 = auto), apply_structure (default true), structure_jitter
#   Outputs: f_rooms (ordered room types), generation_seed, f_difficulty_point, room.r_difficulty_points = index
#   Guarantees: last room always matches get_final_boss_type(total_points) 
#region generate_rooms

func generate_rooms(total_points: int = 100, d_seed: int = -1, apply_structure: bool = true, structure_jitter: float = 0.8) -> void:

	f_rooms.clear()
	f_difficulty_point = total_points

	var use_seed := d_seed
	if use_seed == -1:
		use_seed = randi()
	generation_seed = use_seed

	var rng := RandomNumberGenerator.new()
	rng.seed = use_seed

	var final_type := room_res.get_final_boss_type(total_points)
	var final_cost := room_res.get_cost(final_type)

	if total_points < final_cost:
		var boss_room := room_res.new()
		boss_room.r_type = room_res.room_size.BOSS
		f_rooms.append(boss_room)
		boss_room.r_difficulty_points = 0
		return

	var remaining := total_points - final_cost

	var all_types: Array[room_res.room_size] = [
		room_res.room_size.SMALL,
		room_res.room_size.MEDIUM,
		room_res.room_size.LARGE,
		room_res.room_size.BOSS,
		room_res.room_size.SUPER_BOSS,
		room_res.room_size.GOD_ROOM
	]

	while remaining >= 10:
		var affordable: Array[room_res.room_size] = []
		for type in all_types:
			if room_res.get_cost(type) <= remaining:
				affordable.append(type)
		if affordable.is_empty():
			break
		var idx := rng.randi() % affordable.size()
		var chosen_type: room_res.room_size = affordable[idx]
		var new_room := room_res.new()
		new_room.r_type = chosen_type
		f_rooms.append(new_room)
		remaining -= room_res.get_cost(chosen_type)

	var final_room := room_res.new()
	final_room.r_type = final_type
	f_rooms.append(final_room)

	if apply_structure and f_rooms.size() > 5:
		_apply_pacing_and_structure(rng, structure_jitter)

	for i in range(f_rooms.size()):
		f_rooms[i].r_difficulty_points = i

#endregion


# apply pacing and structure:
#   Input: current f_rooms (raw), rng (seeded), jitter
#   Output: f_rooms reordered for ramp + reduced clustering of high tiers, final boss remains last
#region apply_pacing_and_structure
func _apply_pacing_and_structure(rng: RandomNumberGenerator, jitter: float) -> void:
	if f_rooms.size() <= 1:
		return

	var final_room: room_res = f_rooms.pop_back()

	var scored := []
	for r in f_rooms:
		var tier := room_res.get_tier(r.r_type)
		var j := 0.0
		if rng:
			j = rng.randf_range(-jitter, jitter)
		scored.append({"room": r, "score": tier + j})

	scored.sort_custom(func(a, b): return a.score < b.score)

	f_rooms.clear()
	for s in scored:
		f_rooms.append(s.room)

	var min_distance := 3
	for i in range(f_rooms.size()):
		var t := room_res.get_tier(f_rooms[i].r_type)
		if t < 4:
			continue
		for j in range(max(0, i - min_distance + 1), min(f_rooms.size(), i + min_distance)):
			if i == j: continue
			if room_res.get_tier(f_rooms[j].r_type) >= 4:
				for k in range(max(0, i - 2), min(f_rooms.size(), i + 3)):
					if room_res.get_tier(f_rooms[k].r_type) < 4:
						var tmp = f_rooms[i]
						f_rooms[i] = f_rooms[k]
						f_rooms[k] = tmp
						break
				break

	f_rooms.append(final_room)
#endregion
