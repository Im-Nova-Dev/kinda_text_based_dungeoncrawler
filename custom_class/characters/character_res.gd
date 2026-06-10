extends Resource
class_name character_res

var weapon
var armor
var accessory

var character_level

var c_class

var char_icon : Texture

var current_hunger : int # if hunger is 0 , character dies after 5 rooms
var max_hunger : int

var current_thirst : int # if thirst if 0, character dies after 2 rooms
var max_thirst : int

var hunger_tick_amount : float
var thirst_tick_amount : float

var max_hp
var current_hp

var max_mp
var current_mp


# combat skills
var constitution: int #+defense,+health,+carry weight,-poison duration,%phy def
var strength: int #+attack power, +stun power, +block chance,%to break door/chest/etc
var intelligence: int #+magic power , +mana amount, %mag def
var dexterity: int #+accuracy, +dodge ,+parry
var wisdom: int #+exp earned modifier ,-confusion duration,%elemental defense



var butcher # gathering food and stuff from enemies


# non combat skills
var investigation : int # ability to spot traps and hidden stuff, find better loot
var survival : int # better chance to find food/water,reduced hunger/thirst,
var cooking : int #craft better meals,ration food for longer, use less ingredients
var gathering : int #gather more plants , mushroom , etc
var hunting : int #gather more meat from animals and edible monsters, more damage vs animals

#everything skills
var faith: int # bonus to crits ,bonus to everything

enum character_skills {
	perception,survival_instinct,willpower,fast_healing

	} # gain a new skills every 10 levels ?
