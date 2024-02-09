extends Area2D
class_name PowerUp

@export var FallSpeed : float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.DOWN * FallSpeed * delta


# when off screen destroy
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is player:
		# run power up
		Global.lives += 1
		# destroy
		queue_free()
