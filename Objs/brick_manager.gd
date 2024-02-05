extends Node2D

@onready var numOfBrick = -1

signal NoBricksLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	numOfBrick = get_children().size()
	
	if numOfBrick == 0:
		NoBricksLeft.emit()
