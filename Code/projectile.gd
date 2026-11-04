extends Area2D

const speed = 10

func _process(delta: float) -> void:
	position += transform.x * (speed + delta)
