extends CharacterBody2D

@onready var rng = RandomNumberGenerator.new()

var speed: int = 95
var maxSpeed: int = 245
var inPlay: bool = false
var player

func _ready():
	player = get_parent().get_parent().get_node("Player")
	velocity.x = rng.randf_range(-.5, .5)
	velocity.y = -1

func _physics_process(delta):
	if inPlay:
		var collisionObj = move_and_collide(velocity * speed * delta)
		if collisionObj:
			var objHit = collisionObj.get_collider()
			
			if objHit.is_in_group("Player"):
				# so this make the ball go left if it lands on the left side of the bat or vice versa
				velocity = velocity.from_angle(Vector2(player.position.x, player.position.y).angle_to_point(Vector2(position.x, position.y)))
				if speed < maxSpeed:
					speed += 10
			else:
				velocity = velocity.bounce(collisionObj.get_normal())
			
			#match objHit.get_collision_layer():
				#Global.outOfBoundsLayer:
					##kill ball if falls out
					#queue_free()
				#Global.playerLayer:
	##				# so this make the ball go left if it lands on the left side of the bat or vice versa
					#velocity = velocity.from_angle(Vector2(player.position.x, player.position.y).angle_to_point(Vector2(position.x, position.y)))
					#speed += 10
				#Global.brickLayer:
					#velocity = velocity.bounce(collisionObj.get_normal())
					#objHit.destroyBrick() # delete brick
				#_:
					## build in bounce for any thing else
					#velocity = velocity.bounce(collisionObj.get_normal())
	else:
		position.x = player.position.x
		position.y = player.position.y - 16
	if Input.is_action_pressed("ui_accept"):
		inPlay = true
