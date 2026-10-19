extends Label

@onready var manaCrystalsLabel: Label = $"."

func _ready() -> void:
	GameManager.crystals_changed.connect(update_total_crystals)
func update_total_crystals(new_value: int):
	manaCrystalsLabel.text = "Mana Crystals: " + str(GameManager.manaCrystals)


#Total Crystal UI
