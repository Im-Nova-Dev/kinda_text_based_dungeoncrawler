extends Control
class_name main
# main.gd
@onready var dungeon_visualizer: Control = $dungeon_visualizer
func _ready() -> void:
	var test_floor = floor_res.new()
	test_floor.generate_rooms()
	printerr(test_floor.f_rooms,"<- rooms in a floor test")
func _process(delta: float) -> void:
	pass




var current_turn : Array = []

var is_player_in_combat : bool
var enemies_in_current_room : Array[enemy_res]= []

func combat_start():
	pass # make everything visible

func spawn_enemies():
	pass # spawn a copy of enemy_res and assign attributes

func init_player_party():
	pass # refresh and init player party

func init_player_combat_menus():
	pass # spawn all the menus for the player turn
# each character has its own menu , and when they activate a move they want to use it fires a signal and disapears
#

func show_combat_gui()->void:
	# just a functon that makes them all visible
	#

	pass


func chose_move(_move)->void:
	current_turn.append(_move)
	# goes off when the player chooses a move , puts it in the array or moves
	#check if its the last character



# start
func start_player_turn():
	pass
func start_enemy_turn():
	pass
#finished
func player_finished_turn():
	pass
func enemy_finished_turn():
	pass

func sort_moves_by_initiative_roll(_reversed:bool,_random:bool):
	# sort moves, but if reversed it does reversed sorting,
	# if it does random then the order is randomized
	pass


func execute_moves():
	#execute the moves one by one doing damage and healing and everything
	pass

func combat_end():
	# ends the combat , hides all the combat GUI
	# distribute loot
	pass

# all test functions
func _on_test_spawn_player_pressed() -> void:
	var test_character = character_res.new()
	test_character.set_test_character()
	Global.player_party.append(test_character)


func _on_test_spawn_enemy_pressed() -> void:
	pass # Replace with function body.


func _on_test_start_combat_pressed() -> void:
	pass # Replace with function body.
