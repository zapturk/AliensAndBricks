extends StaticBody2D

@onready var rng = RandomNumberGenerator.new()

var powerup = preload("res://Objs/power_up.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func OnHit():
	# deterim if it will drop a power up
	if rng.randi_range(1, 10) == 10:
		var newPowerup = powerup.instantiate()
		newPowerup.position = position
		get_parent().get_parent().add_child(newPowerup)
	
	# Destroy brick
	queue_free()
