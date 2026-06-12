extends Node
# global file
var is_player_in_combat :bool = false

var player_party : Array[character_res] = []


var number_of_floors_cleared : int = 0
var player_difficulty_points : int = 100


func _ready() -> void:
	pass # Replace with function body.
func _process(delta: float) -> void:
	pass
	# this is really just so that the fucking lsp stops screaming at me

	#   Inputs: total_points, d_seed, apply_structure, structure_jitter
	#   Output: floor_res with f_rooms populated according to the contract in generate_rooms
func generate_floor(total_points: int = 100, d_seed: int = -1, apply_structure: bool = true, structure_jitter: float = 0.8) -> floor_res:
	var d_floor := floor_res.new()
	d_floor.generate_rooms(total_points, d_seed, apply_structure, structure_jitter)
	return d_floor

func generate_room() -> room_res:
	var room := room_res.new()
	return room
#   Inputs: number_of_floors_cleared (before this call), player_difficulty_points
#   Outputs: player_difficulty_points increased by a random amount whose range grows with clears
#   Guarantees: gain is always positive and grows on average; output is fully random within expanding ranges
func award_clear_points():
	var clears = number_of_floors_cleared

	var min_gain = 40 + clears * 20
	var max_gain = 100 + clears * 60 + (clears * clears * 5)

	var gained = randi_range(min_gain, max_gain)

	# swings so runs feel very different
	if randf() < 0.1:
		gained = int(gained * randf_range(0.4, 2.8))

	# floor that still grows
	gained = max(gained, 25 + clears * 5)

	player_difficulty_points += gained
	number_of_floors_cleared += 1
# award points for next dungeon generation , difficulty and loot increase
# *if dungeon difficulty number ends with XYZ number then spawn legendary item*


func test():

	pass
