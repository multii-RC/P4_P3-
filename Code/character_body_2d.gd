extends CharacterBody2D

#player stats
@export var SPEED = 150.0
@export var JUMP_VELOCITY = -350.0

func _ready() -> void:
	GameManager.player_speed_changed.connect(speed_change)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#contract speed change implementation
func speed_change(new_value: int):
	SPEED -= SPEED * (new_value * .1)
	
