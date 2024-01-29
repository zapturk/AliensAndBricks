extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func OnHit():
	# deterim if it will drop a power up
	
	# Destroy brick
	queue_free()
