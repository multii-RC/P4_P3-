extends Area2D

#Boss stats that are variable
@export var bossHealth: int
@export var bossAtkSpd: float
@export var bossDefense: float
@export var bossDamage: int
@export var bossActive: bool 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bossActive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
