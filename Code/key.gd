extends Area2D

#add 1 crystal when collecting them on the map
func _on_body_entered(body: Node2D) -> void:
	print("key collected")

	GameManager.add_crystal(1)
	queue_free()
