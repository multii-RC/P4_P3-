extends Area2D

# Same as @export, which allows you to edit the variable in the inspector
# @export_multiline give you a multiline textbox to edit
@export_multiline var dialog: Array[String]

# Variables needed
var current_line: int
@onready var dialog_label :Label = $Label
var is_interactable: bool

#Contract decision buttons
@onready var acceptButton: Button = $Accept
@onready var declineButton: Button = $Decline

#Contract Outcome variables
@export var add_value: int
@export var cost_value: int
@export var speed_change: int



func _ready() -> void:
	# initialize all variables
	current_line = -1  # I'm using -1 to indicate not started, since index 0 is the first line
	dialog_label.visible = false
	is_interactable = false
	acceptButton.visible = false
	declineButton.visible = false

func _input(event: InputEvent) -> void:
	# Skip if not interactable or not visible
	if not is_interactable:
		return
	#Show decision buttons on final line
	if current_line == 4:
		acceptButton.visible = true
		declineButton.visible = true
		
	# If “action” is just pressed	
	if Input.is_action_just_pressed("Interact"): 
		# If dialog hasn't started, initialize it
		if current_line == -1:
			current_line = 0
			dialog_label.text = dialog[current_line]
			dialog_label.visible = true
		# If the line in within the array size, set label to current line in array
		elif current_line < dialog.size() -1:
			current_line += 1
			dialog_label.text = dialog[current_line]
		# If reaches the last line, end the dialog
		else:
			dialog_label.visible = false
			current_line = -1
			# You can also add some trigger here too


func _on_body_entered(body: Node2D) -> void:
	is_interactable = true
	dialog_label.text = "Press E to continue" # intial Prompt
	dialog_label.visible = true
	
	
func _on_body_exited(body: Node2D) -> void:
	is_interactable = false
	current_line = -1
	dialog_label.text = ""
	dialog_label.visible = false
	acceptButton.visible = false
	declineButton.visible = false

#Send the reward values to gamemanger and make the contract disappear if accepted
func _on_accept_pressed() -> void:
	print(GameManager.manaCrystals)
	if GameManager.manaCrystals >= cost_value:
		GameManager.add_crystal(add_value - cost_value)
		GameManager.player_stat_change(speed_change)
		queue_free()
	else:
		return

#Reset dialogue if declined
func _on_decline_pressed() -> void:
	dialog_label.visible = false
	acceptButton.visible = false
	declineButton.visible = false
	current_line = -1
