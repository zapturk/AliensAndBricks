extends Node2D

const BALLLIMIT := 10

@onready var ballCount = -1
@onready var speedChange := 60

var ball = preload("res://Objs/ball.tscn")

signal NoBallsLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	CreateBall()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	ballCount = get_children().size()
	
	if ballCount == 0:
		NoBallsLeft.emit()
		ballCount = -1

func CreateBall():
	if ballCount < BALLLIMIT:
		add_child(ball.instantiate())
		ballCount = get_children().size()

func slowball():
	for ballIns in get_children():
		if ballIns.speed <= ballIns.minSpeed + speedChange:
			ballIns.speed = ballIns.minSpeed
		else:
			ballIns.speed -= speedChange

func fastball():
	for ballIns in get_children():
		if ballIns.speed >= ballIns.maxSpeed - speedChange:
			ballIns.speed = ballIns.maxSpeed
		else:
			ballIns.speed += speedChange

func multiball():
	for ballIns in get_children():
		var newBallX = ball.instantiate()
		var newBallY = ball.instantiate()
		
		newBallX.inPlay = true
		newBallY.inPlay = true
		
		newBallX.position = ballIns.position
		newBallY.position = ballIns.position
		
		newBallX.speed = ballIns.speed
		newBallY.speed = ballIns.speed
		
		newBallX.velocity = ballIns.velocity.rotated(deg_to_rad(135))
		newBallY.velocity = ballIns.velocity.rotated(deg_to_rad(-135))
		
		if get_child_count() < Global.ballLimit-1:
			call_deferred("add_child", newBallX)
			call_deferred("add_child",newBallY)
			
			
			
