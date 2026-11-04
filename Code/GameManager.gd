extends Node

#Player stats
var playerHealth: int 
var playerBaseHealth: int = 100
var playerDefense: int
var playerAttack: float
var playerLuck: float

#boss stats
var bossAtkSpd: float
var bossDefense: float
var bossDamage: int
var bossLuck: float
var bossHealth: int


#Updating crystal totals
signal crystals_changed(manaCrystals)
var manaCrystals: int
var player: CharacterBody2D

var projectile: Area2D

#updating stats
signal player_speed_changed(stat_change)
var stat_change: int

func _ready() -> void:
	manaCrystals = 0
	playerHealth = playerBaseHealth
	playerDefense = 2
	playerAttack = 15
	playerLuck = 10
	
#every crystal update goes through this
func add_crystal(value):
	manaCrystals += value
	crystals_changed.emit(manaCrystals)
	
func player_stat_change(stat_change):
	player_speed_changed.emit(stat_change)
	

	
