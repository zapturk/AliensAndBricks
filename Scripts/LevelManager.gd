extends Node2D

@export_file("*.tscn") var NextLevel : String
@export var LevelNumber := "0"
@export var Name := "Debug"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.CurrentLevel = LevelNumber
	Global.LevelName = Name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ball_manager_no_balls_left():
	# lose life
	Global.lives -= 1
	
	# if life is zero set game over
	if Global.lives < 0:
		# go back to main menu
		set_physics_process(false)
		
		SceneLoader.load_scene("res://App/Scenes/Menus/MainMenu/MainMenu.tscn")
	else:
		# else spawn new ball
		$BallManager.CreateBall()


func _on_brick_manager_no_bricks_left():
	# show level compealte
	print("Level Compleat")
	
	# go to next level
	#SceneLoader.load_scene(NextLevel)

func multiball():
	$BallManager.multiball()
