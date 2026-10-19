extends Area2D

var bodyInside = false

func _ready() -> void:
	$AnimatedSprite2D.play("default")

#detecting player
func _on_body_entered(body: Node2D) -> void:
	bodyInside = true
	print("body enetered")

#the player need to press "E" to interact with the next level gate
func _input(event: InputEvent) -> void:
	if bodyInside and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
		print("next level")
	else:
		return

func _on_body_exited(body: Node2D) -> void:
	bodyInside = false
