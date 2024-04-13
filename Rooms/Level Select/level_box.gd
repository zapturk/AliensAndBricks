extends Button

@export var locked = true:
	set = set_locked
@export var level_num = 1:
	set = set_level

@onready var lock = $MarginContainer/Lock
@onready var label = $Label
	
func set_locked(value):
	locked = value
	if not is_inside_tree():
		await ready
	lock.visible = value
	label.visible = not value

func set_level(value):
	level_num = value
	if not is_inside_tree():
		await ready
	label.text = str(level_num)

func _on_pressed():
	if locked:
		return
	else:
		var level = "res://Rooms/level" + str(level_num) + ".tscn"
		SceneLoader.load_scene(level)
