extends Node
var change = false;
var level = 1
func _process(_delta: float) -> void:
	if(change):
		change = false;
		if(level == 2):
			get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
		elif(level == 3):
			get_tree().change_scene_to_file("res://Scenes/level_3.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/Level.tscn")
