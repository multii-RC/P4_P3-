extends Area2D

#want to be able to set cost values for new doors if I add them
@export var doorCost: int

#door popup to tell the player the cost, when next to it
@onready var doorLabel: Label = $Label
func _ready() -> void:
	doorLabel.visible = false
	doorLabel.text = "You need " + str(doorCost) + " Crystals!"

#Going through door, checks cost, if not enough, enables the popup
func _on_body_entered(body: Node2D) -> void:
	print("player entered")
	
	if GameManager.manaCrystals >= doorCost:
		$Door.queue_free()
		GameManager.add_crystal(-doorCost)
		queue_free()
	else:
		print("Not Enough Mana Crystals, you need " + str(doorCost))
		doorLabel.visible = true
		return
			
#popup goes away when not next to door
func _on_body_exited(body: Node2D) -> void:
	doorLabel.visible = false
