extends CharacterBody3D
var v = -5
var way = 1
func _physics_process(delta: float) -> void:
	velocity.x = v
	v += delta * way
	if(way == 1 && v > 5):
		way = -1
	elif(way == -1 && v < -5):
		way = 1
	move_and_slide()	
