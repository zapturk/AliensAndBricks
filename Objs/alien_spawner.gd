extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("RESET")
	$Timer.start(randf_range(1.5, 5.0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$AnimationPlayer.play("Spawn")
	await $AnimationPlayer.animation_finished
	
	$AnimationPlayer.play("RESET")

func startNewTimer():
	$Timer.start(randf_range(1.5, 5.0))
