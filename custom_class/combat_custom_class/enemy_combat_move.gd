extends Resource
class_name enemy_combat_move


var target : character_res
var source : enemy_res
var init_roll : int 


var move_name
var base_damage
var damage_type : d_type
enum d_type {PHY,MAG,DARK,LIGHT}
