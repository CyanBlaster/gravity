extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Music Control")):
		if(stream_paused):
			stream_paused = false
		else:
			stream_paused = true
