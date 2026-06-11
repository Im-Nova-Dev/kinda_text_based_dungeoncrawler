extends Resource
class_name character_combat_move


var target:enemy_res
var source:character_res
var init_roll:int


var move_name:String
var base_damage:int

var is_skill_heal:bool
var heal_power:int

var damage_type:d_type
enum d_type {PHY,MAG,DARK,LIGHT}
