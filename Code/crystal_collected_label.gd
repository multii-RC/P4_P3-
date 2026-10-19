extends Node2D

@onready var crystalCollected: Label = $CrystalCollected

# Connect the collection signal to the label
func _ready() -> void:
	crystalCollected.visible = false
	GameManager.crystals_changed.connect(update_total_crystals)

#Make the collection popup occur at current player location
func update_total_crystals(new_value: int):
	crystalCollected.global_position = $"../player/Camera2D/PlayerPosition".global_position
	crystalCollected.visible = true
	$CrystalCollectTimer.start()
	print("crystal collect")

#popup disappears after certain amount of time
func _on_crystal_collect_timer_timeout() -> void:
	crystalCollected.visible = false
