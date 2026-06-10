extends Control
class_name main
# main.gd 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	printerr(delta)

var current_turn : Array = []

var is_player_in_combat : bool
var enemies_in_current_room : Array[enemy_res]= []

func combat_start():
	pass

func spawn_enemies():
	pass

func init_player_party():
	pass

func init_player_combat_menus():
	pass

func show_combat_gui()->void:
	pass


func chose_move(_move)->void:
	current_turn.append(_move)
	#check if its the last character







func player_finished_turn():
	pass

func sort_moves_by_initiative_roll():
	pass

func execute_move():
	pass

func combat_end():
	pass
