extends Resource
class_name enemy_res

enum e_type {WILDLIFE,MONSTER,BOSS}
var enemy_type


var enemy_species

var enemy_icon : Texture

var max_hp
var current_hp

var max_mp
var current_mp


# combat skills
var constitution: int
var strength: int
var intelligence: int
var dexterity: int
var wisdom: int
var luck: int

var food_loot_table = []
var equipment_loot_table = []
