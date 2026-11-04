extends Area2D

var bossDead: bool
var bodyInside = false

func _ready() -> void:
	bossDead = false
	$AnimatedSprite2D.play("notActive")
	
#detecting player
func _on_body_entered(body: Node2D) -> void:
	bodyInside = true
	print("body enetered")

#if the boss is beaten, let the player move to next level
func _input(event: InputEvent) -> void:
	if bodyInside and bossDead and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
		print("next level")
	else:
		return

func _on_body_exited(body: Node2D) -> void:
	bodyInside = false

func _on_boss_1_boss_killed() -> void:
	bossDead = true
	$AnimatedSprite2D.play("active")
