extends Area2D
class_name PowerUp

@export var FallSpeed : float
signal Multiball

var type = "default"
var chance = 0

var powerupType = [
	{"type": "heart", "chance": 2},
	{"type": "multiball", "chance": 10},
	#{"type": "magnet", "chance": 5}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for index in powerupType.size():
		chance += powerupType[index].get("chance")
	
	var pick = randi_range(0, chance)
	
	for index in powerupType.size():
		if pick <= powerupType[index].get("chance"):
			type = powerupType[index].get("type")
			$AnimatedSprite2D.play(type)
			return
		pick -= powerupType[index].get("chance")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.DOWN * FallSpeed * delta


# when off screen destroy
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is player:
		# run power up
		ActivatePowerup()
		
		# destroy
		queue_free()

func ActivatePowerup():
	match type:
		"heart":
			if Global.lives < 6:
				Global.lives += 1
		"multiball":
			get_parent().multiball()
		"magnet":
			print("magnet")
		_:
			print(type)
			print("error")
