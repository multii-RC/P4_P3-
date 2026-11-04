extends Area2D

#Boss stats that are variable

@export var bossBaseHealth: int

var bossActive: bool 
signal bossKilled
@onready var attackSpawn : Marker2D = $AnimatedSprite2D/AttackSpawn

@export var enemyProjectile: PackedScene

@onready var cooldown: Timer = $Cooldown

@onready var healthBar: TextureProgressBar = $HealthBar
@onready var healthBarValue: Label = $HealthBar/HealthValue

func _ready() -> void:
	bossActive = false
	healthBar.visible = false
	healthBarValue.visible = false
	$AnimatedSprite2D.play("active")
	bossBaseHealth = 100
	GameManager.bossHealth = bossBaseHealth
	GameManager.bossAtkSpd = 2
	GameManager.bossDefense = 5
	GameManager.bossDamage = 30
	GameManager.bossLuck = 5.31459
	
	
	
func _on_door_door_open() -> void:
	bossActive = true
	print("Boss active")
	healthBar.visible = true
	healthBarValue.visible = true
	if bossActive:
		cooldown.wait_time = GameManager.bossAtkSpd
		cooldown.start()
		

func _process(delta: float) -> void:
	if GameManager.bossHealth <= 0 :
		bossKilled.emit()
		healthBar.queue_free()
		healthBarValue.queue_free()
	


func _on_timer_timeout() -> void:
	var newProjectile = enemyProjectile.instantiate() as Node2D
	get_tree().current_scene.add_child(newProjectile)
	newProjectile.global_position = attackSpawn.global_position
	newProjectile.look_at(GameManager.player.global_position)
	print("Boss Attack")



func _on_body_entered(body: Node2D) -> void:
	if GameManager.player:
		GameManager.bossHealth -= (GameManager.playerAttack - GameManager.bossDefense)
