extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 6
var gravity = 1

@export var camera : Camera3D

func _input(event):
	move_camera(event)

func move_camera(event: InputEvent):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * 0.1)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60));
func _physics_process(delta: float) -> void:
	if(gravity == 1):
		if not is_on_floor():
			velocity += get_gravity() * delta
	else:
		if not is_on_ceiling():
			velocity -= get_gravity() * delta

	if Input.is_action_just_pressed("Jump"):
		print("x")
		if(gravity == 1):
			if(is_on_floor()):
				print("right side up")
				velocity.y = JUMP_VELOCITY
		else:
			print("down")
			if(is_on_ceiling()):
				print("upside down")
				velocity.y = -JUMP_VELOCITY
			else:
				print(is_on_ceiling())
	
	if Input.is_action_just_pressed("Gravity") && (is_on_ceiling() || is_on_floor()):
		if(gravity == 1):
			gravity = -1
		else:
			gravity = 1
			
	if(position.y > 100 || position.y < -100):
		position = Vector3(0, 0, 0)
		velocity.y = 0
		gravity = 1
		
	var input_dir := Input.get_vector("Forward", "Backward", "Right", "Left")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body.name)
	if(body.name.begins_with("Spiky") && is_on_floor()):
		position = Vector3(0, 0, 0)
		velocity.y = 0
		gravity = 1
	elif(body.name.begins_with("spikey") && is_on_ceiling()):
		position = Vector3(0, 0, 0)
		velocity.y = 0
		gravity = 1
