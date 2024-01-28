extends Node2D

@onready var numOfBrick = -1

signal NoBricksLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	if numOfBrick == 0:
		NoBricksLeft.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
