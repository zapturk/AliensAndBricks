extends Node2D

@export_file("*.tscn") var NextLevel : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_manager_no_balls_left():
	# lose life
	
	# if life is zero set game over
	
	# else spawn new ball
	$BallManager.CreateBall()


func _on_brick_manager_no_bricks_left():
	# show level compealte
	print("Level Compleat")
	
	# go to next level
	#SceneLoader.load_scene(NextLevel)
