extends Area2D

#Boss stats that are variable
@export var bossHealth: int
@export var bossAtkSpd: float
@export var bossDefense: float
@export var bossDamage: int
var bossActive: bool 
signal bossKilled

@export var projectile: PackedScene

func _ready() -> void:
	bossActive = false
	$AnimatedSprite2D.play("active")
	
func _on_door_door_open() -> void:
	bossActive = true
	print("Boss active")

func _process(delta: float) -> void:
	if bossHealth <= 0 :
		bossKilled.emit()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Attack"):
		var newProjectile = projectile.instantiate() as Node2D
		get_tree().current_scene.add_child(newProjectile)
		newProjectile.global_position = global_position
		newProjectile.look_at(GameManager.player.global_position)
