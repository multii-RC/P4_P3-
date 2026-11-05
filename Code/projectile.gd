extends Area2D

const speed = 2

func _process(delta: float) -> void:
	position += transform.x * (speed + delta)

func _ready() -> void:
	GameManager.projectile = self
