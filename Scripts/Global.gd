extends Node

const wallLayer: int = 1 
const playerLayer: int = 2 
const brickLayer: int = 4
const outOfBoundsLayer: int = 16

@onready var lives := 3
@onready var CurrentLevel := "0"
@onready var LevelName := "Debug"
@onready var ballLimit := 10
@onready var BricksLeft := -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
