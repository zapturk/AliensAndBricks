extends Node2D

const BALLLIMIT := 10

@onready var ballCount = 0

var ball = preload("res://Objs/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	CreateBall()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func CreateBall():
	if ballCount < BALLLIMIT:
		add_child(ball.instantiate())
