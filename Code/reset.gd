extends Area2D

#resets the player if they fall off the map
func _on_body_entered(body: Node2D) -> void:
	print("Body enters world boundary")
	$"../player".global_position = $Marker2D.global_position
		
