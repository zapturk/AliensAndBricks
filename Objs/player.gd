extends CharacterBody2D
class_name player

const SPEED = 250

func _ready():
	pass

func _physics_process(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
