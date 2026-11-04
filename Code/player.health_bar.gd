extends TextureProgressBar

@onready var playerHealthBarValue: Label = $HealthValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = GameManager.playerHealth
	min_value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = GameManager.playerHealth
	playerHealthBarValue.text = str(GameManager.playerHealth)
