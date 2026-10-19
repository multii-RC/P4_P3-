extends Area2D

var isInteractable = false
@onready var vaseLabel: Label = $Label

func _ready() -> void:
	vaseLabel.visible = false

#Give a hint on how to collect, and allow interaction
func _on_body_entered(body: Node2D) -> void:
	isInteractable = true
	vaseLabel.visible = true
		
func _input(event: InputEvent) -> void:
	# Skip if not interactable or not visible
	if not isInteractable:
		return
	
	#Make the player press "E" to collect, destroy vase after collection
	if Input.is_action_just_pressed("Interact"):
		GameManager.add_crystal(1)
		queue_free()
		
func _on_body_exited(body: Node2D) -> void:
	isInteractable = false
	vaseLabel.visible = false
