extends CanvasLayer

@onready var anim = $AnimationPlayer

func FadeToBlack():
	anim.play("FadeToBlack")
	await anim.animation_finished
	return true
	
func FadeFromBlack():
	anim.play("FadeFromBlack")
	await anim.animation_finished
	return true
