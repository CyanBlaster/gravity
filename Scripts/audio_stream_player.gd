extends AudioStreamPlayer

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Music Control")):
		if(stream_paused):
			stream_paused = false
		else:
			stream_paused = true
