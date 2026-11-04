extends Area2D

const speed = 1

func _process(delta: float) -> void:
	position += transform.x * (speed + delta)
