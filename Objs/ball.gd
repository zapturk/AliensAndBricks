extends CharacterBody2D
class_name Ball

@onready var rng = RandomNumberGenerator.new()

var speed: int = 135
var maxSpeed: int = 245
@export var inPlay: bool = false
var playerIns

func _ready():
	rng.randomize()
	
	if !inPlay:
		playerIns = get_parent().get_parent().get_node("Player")
	
	# default direction the ball should go
	if velocity == Vector2.ZERO:
		velocity.x = rng.randf_range(-.5, .5)
		velocity.y = -1

func _physics_process(delta):
	if inPlay:
		var collisionObj = move_and_collide(velocity * speed * delta)
		if collisionObj:
			var objHit = collisionObj.get_collider()
			
			if objHit.is_in_group("Player"):
				# so this make the ball go left if it lands on the left side of the bat or vice versa
				velocity = Vector2.from_angle(Vector2(playerIns.position.x, playerIns.position.y).angle_to_point(Vector2(position.x, position.y)))
				if speed < maxSpeed:
					speed += 10
			elif objHit.is_in_group("Brick"):
				velocity = velocity.bounce(collisionObj.get_normal())
				objHit.OnHit()
			else:
				velocity = velocity.bounce(collisionObj.get_normal())
	else:
		position.x = playerIns.position.x
		position.y = playerIns.position.y - 16
	if Input.is_action_pressed("ui_accept"):
		inPlay = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
