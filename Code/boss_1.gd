extends Area2D

#Boss stats that are variable
@export var bossHealth: int
var bossBaseHealth = 100
@export var bossAtkSpd: float
@export var bossDefense: float
@export var bossDamage: int
@export var bossLuck: float
var bossActive: bool 
signal bossKilled
@onready var attackSpawn : Marker2D = $AnimatedSprite2D/AttackSpawn

@export var enemyProjectile: PackedScene

func _ready() -> void:
	bossActive = false
	$AnimatedSprite2D.play("active")
	bossHealth = bossBaseHealth
	bossAtkSpd = 1
	bossDefense = 5
	bossDamage = 30
	bossLuck = 5.31459
	
func _on_door_door_open() -> void:
	bossActive = true
	print("Boss active")

func _process(delta: float) -> void:
	if bossHealth <= 0 :
		bossKilled.emit()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Attack"):
		var newProjectile = enemyProjectile.instantiate() as Node2D
		get_tree().current_scene.add_child(newProjectile)
		newProjectile.global_position = attackSpawn.global_position
		newProjectile.look_at(GameManager.player.global_position)
