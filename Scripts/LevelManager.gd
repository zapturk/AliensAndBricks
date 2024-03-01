extends Node2D

@export_file("*.tscn") var NextLevel : String
@export_file("*.tscn") var MainMenu : String 
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
		pauseEverything()
		$GameOver.add_theme_icon_override("close", Texture2D.new()) 
		$GameOver.show()
	else:
		# else spawn new ball
		$BallManager.CreateBall()


func _on_brick_manager_no_bricks_left():
	# show level compealte
	pauseEverything()
	#$NextLevel.add_theme_icon_override("close", Texture2D.new()) 
	#$NextLevel.show()
	_on_next_level_confirmed()

func multiball():
	$BallManager.multiball()
	
func slowball():
	$BallManager.slowball()
	
func fastball():
	$BallManager.fastball()

func _on_next_level_confirmed():
	SceneLoader.load_scene(NextLevel)

func _on_game_over_confirmed():
	SceneLoader.load_scene(MainMenu)

func pauseEverything():
	for ballIns in $BallManager.get_children():
		ballIns.set_physics_process(false)
	$Player.set_physics_process(false)
