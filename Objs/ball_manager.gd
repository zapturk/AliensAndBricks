extends Node2D

const BALLLIMIT := 10

@onready var ballCount = -1

var ball = preload("res://Objs/ball.tscn")

signal NoBallsLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	CreateBall()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ballCount = get_children().size()
	
	if ballCount == 0:
		NoBallsLeft.emit()
		ballCount = -1

func CreateBall():
	if ballCount < BALLLIMIT:
		add_child(ball.instantiate())
		ballCount = get_children().size()
