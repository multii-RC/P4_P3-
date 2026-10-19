extends Node

#Updating crystal totals
signal crystals_changed(manaCrystals)
var manaCrystals: int

#updating stats
signal player_speed_changed(stat_change)
var stat_change: int

@export_multiline var level: Array[String]
var currentLevel: int


func _ready() -> void:
	manaCrystals = 0
	currentLevel = 1
	level[1] ="res://Scenes/world.tscn"
	level[2] ="res://Scenes/Level2.tscn"
	level[3] ="res://Scenes/Level3.tscn"
#every crystal update goes through this
func add_crystal(value):
	manaCrystals += value
	crystals_changed.emit(manaCrystals)
	
func player_stat_change(stat_change):
	player_speed_changed.emit(stat_change)
	
