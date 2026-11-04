extends Area2D

#Boss stats that are variable
@export var bossHealth: int
@export var bossAtkSpd: float
@export var bossDefense: float
@export var bossDamage: int
var bossActive: bool 
signal bossKilled

func _ready() -> void:
	bossActive = false
	
func _on_door_door_open() -> void:
	bossActive = true
	print("Boss active")

func _process(delta: float) -> void:
	if bossHealth <= 0 :
		bossKilled.emit()
