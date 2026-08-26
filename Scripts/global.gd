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
		elif(level == 4):
			get_tree().change_scene_to_file("res://Scenes/level_4.tscn")
		elif(level == 5):
			get_tree().change_scene_to_file("res://Scenes/level_5.tscn")
		elif(level == 6):
			get_tree().change_scene_to_file("res://Scenes/level_6.tscn")
		elif(level == 7):
			get_tree().change_scene_to_file("res://Scenes/the_end.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/Level.tscn")
