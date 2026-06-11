extends Resource
class_name character_res

# every floor is one year or a half year?
var character_age : int
# possible age system where the older you are the more frail you are
# lose physical defense and physical attack but would get more
# intelligence and wisdom,

# age buffs and debuffs is a bell curve, weakr early , strongest mid , weak late

#types of run enders :
##short term surival,food n shit
##combat survival
###age

# run almost never ends with age but ageing promotes death 
#
# melee classes will start to suffer at old age
# magical or wisdom / intell dependent classes will suffer
# at the start but scale really well
#
## examples of age related skills
# old mages would have a one hit ko move that would kill themselves
# old clerics can live almost forever with right build
# old warriors have a last stand , cant die for 2 turns then die
#have artifacts that either replace party characters or make them	
# age less fast
#
#some characters would grow old and just leave the party to stay in
# the safe zone out of fear of death
#


var main_hand
var off_hand
var armor
var accessory_1
var accessory_2

var character_level:int

enum c_profession {TEMPLAR,KNIGHT,SURVIVALIST,COOK,GATHERER,HUNTER,BUTCHER}
var character_profession : c_profession

# TODO: spell identification , item identification , cursed items,

#TODO : color coated rarities for items , just change color of text displayed 
# when displaying that item



# PROFESSION (give characters skills, bonuses and malus depending on what)
#forgemage:int#mage that upgrade items (need to renamea and find equivalent)

#survivalist : int # better chance to find food/water,reduced hunger/thirst,
#cook : int #craft better meals,ration food for longer, use less ingredients
#gatherer : int #gather more plants , mushroom , etc
#hunter : int #gather more meat from animals and edible monsters, more damage vs animals
#butcher # gathering food and stuff from enemies


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

var inventory_weight_contribution : float = 0.5 #kg
# combat skills
var constitution: int #+defense,+health,+carry weight,-poison duration,%phy def
var strength: int #+attack power, +stun power, +block chance,%to break door/chest/etc
var intelligence: int #+magic power , +mana amount, %mag def
var dexterity: int #+accuracy, +dodge ,+parry

var item_identification:int
#everything skills
var faith: int # bonus to crits ,bonus to everything
var investigation : int # ability to spot traps and hidden stuff, find better loot


enum character_skills {
	perception,survival_instinct,willpower,fast_healing,cannibal

	} # gain a new skills every 10 levels ?
