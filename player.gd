extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = 1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if(gravity == 1):
		if not is_on_floor():
			velocity += get_gravity() * delta
	else:
		if not is_on_ceiling():
			velocity -= get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if(gravity == 1 && is_on_floor()):
			velocity.y = JUMP_VELOCITY
		if(gravity == -1 && is_on_ceiling()):
			velocity.y = -JUMP_VELOCITY
	
	if Input.is_action_just_pressed("Gravity"):
		if(gravity == 1):
			gravity = -1
		else:
			gravity = 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
