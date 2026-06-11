extends Resource
class_name room_res

enum room_size {
	SMALL,
	MEDIUM,
	LARGE,
	BOSS,
	SUPER_BOSS,
	GOD_ROOM
}

var is_there_treasure : bool
var is_enemy_in_room : bool 


var r_type : room_size
var lootable_containers : int
var r_difficulty_points : int

static func get_cost(type: room_size) -> int:
	match type:
		room_size.SMALL: return 10
		room_size.MEDIUM: return 15
		room_size.LARGE: return 20
		room_size.BOSS: return 30
		room_size.SUPER_BOSS: return 300
		room_size.GOD_ROOM: return 1000
		_: return 10

# Black box:
#   Input: total_points
#   Output: the room_size that must be used as the final room for this budget
static func get_final_boss_type(total_points: int) -> room_size:
	if total_points >= 10000: return room_size.GOD_ROOM
	elif total_points >= 1000: return room_size.SUPER_BOSS
	else: return room_size.BOSS

# Black box:
#   Input: room_size
#   Output: integer tier (0=SMALL ... 5=GOD_ROOM) for pacing calculations
static func get_tier(type: room_size) -> int:
	match type:
		room_size.SMALL: return 0
		room_size.MEDIUM: return 1
		room_size.LARGE: return 2
		room_size.BOSS: return 3
		room_size.SUPER_BOSS: return 4
		room_size.GOD_ROOM: return 5
		_: return 0
