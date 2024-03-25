extends CharacterBody2D

@onready var speed = 125

func _ready():
	# default direction the ball should go
	if velocity == Vector2.ZERO:
		velocity.x = randf_range(-.5, .5)
		velocity.y = 1

func _physics_process(delta):
	var collisionObj = move_and_collide(velocity * speed * delta)
	
	if collisionObj:
		var objHit = collisionObj.get_collider()
			
		if objHit.is_in_group("Ball"):
			speed = 0
			velocity = Vector2.ZERO
			$CollisionShape2D.set_disabled(true)
			$AnimatedSprite2D.play("death")
		else:
			velocity = velocity.bounce(collisionObj.get_normal())
	
			


func _on_animated_sprite_2d_animation_finished():
	if($AnimatedSprite2D.animation == "death"):
		queue_free()
