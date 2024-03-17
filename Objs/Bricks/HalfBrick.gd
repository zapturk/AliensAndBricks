extends StaticBody2D

@onready var rng = RandomNumberGenerator.new()
@export var itemBrick := false

var powerup = preload("res://Objs/power_up.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

func OnHit():
	# Play dissoving
	$AnimationPlayer.play("dissolving")

	# deterim if it will drop a power up
	if rng.randi_range(1, 10) == 10 || itemBrick:
		var newPowerup = powerup.instantiate()
		newPowerup.position = get_parent().position
		get_parent().get_parent().get_parent().add_child(newPowerup)
	
func starFree():
	# Destroy brick
	get_parent().queue_free()
