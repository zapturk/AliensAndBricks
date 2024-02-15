extends Node

func play(sound, vol = 0.0):
	var audio := AudioStreamPlayer.new()
	audio.volume_db = vol
	audio.stream = sound
	audio.finished.connect(audio.queue_free)
	add_child(audio)
	audio.play()
