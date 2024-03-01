extends StaticBody2D

@onready var rng = RandomNumberGenerator.new()
@export var itemBrick := false
@export var ballBrick := false

var powerup = preload("res://Objs/power_up.tscn")
var ball = preload("res://Objs/Balls/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func OnHit():
	# play shader
	if ballBrick:
		var newBall : Ball = ball.instantiate() 
		newBall.position = position
		newBall.inPlay = true
		get_parent().get_parent().get_node("BallManager").add_child(newBall)
		
		queue_free()
	else:
		# Play dissoving
		$AnimationPlayer.play("dissolving")
	
		# deterim if it will drop a power up
		if rng.randi_range(1, 10) == 10 || itemBrick:
			var newPowerup = powerup.instantiate()
			newPowerup.position = position
			get_parent().get_parent().add_child(newPowerup)
	
func starFree():
	# Destroy brick
	queue_free()
