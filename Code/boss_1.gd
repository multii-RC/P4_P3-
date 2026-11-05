extends Area2D

#Boss stats that are variable

@export var bossBaseHealth: int

var bossActive: bool 
signal bossKilled
@onready var attackSpawn : Marker2D = $AnimatedSprite2D/AttackSpawn

@export var enemyProjectile: PackedScene

@onready var cooldown: Timer = $Cooldown

@onready var healthBar: TextureProgressBar = $HealthBar



func _ready() -> void:
	bossActive = false
	healthBar.visible = false
	$AnimatedSprite2D.play("active")
	bossBaseHealth = 100
	GameManager.bossHealth = bossBaseHealth
	GameManager.bossAtkSpd = 2
	GameManager.bossDefense = 5
	GameManager.bossDamage = 30
	GameManager.bossLuck = 5.31459
	
	
#activate the boss and release his cage
func _on_door_door_open() -> void:
	bossActive = true
	print("Boss active")
	healthBar.visible = true
	if bossActive:
		cooldown.wait_time = GameManager.bossAtkSpd
		cooldown.start()
		
#boss death
func _process(delta: float) -> void:
	if bossActive and GameManager.bossHealth <= 0 :
		bossKilled.emit()
		healthBar.queue_free()
		bossActive = false
		cooldown.stop()
	

#boss attack loop
func _on_timer_timeout() -> void:
	var newProjectile = enemyProjectile.instantiate() as Node2D
	get_tree().current_scene.add_child(newProjectile)
	newProjectile.global_position = attackSpawn.global_position
	newProjectile.look_at(GameManager.player.global_position)
	print("Boss Attack")


#player can attack boos by entering hitbox
func _on_body_entered(body: Node2D) -> void:
	if GameManager.player:
		GameManager.bossHealth -= (GameManager.playerAttack - GameManager.bossDefense)
