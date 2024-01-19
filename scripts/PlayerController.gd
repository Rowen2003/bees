extends CharacterBody3D


@export var speed = 5.0

var input_dir : Vector3

func _ready():
	pass

func _unhandled_input(event: InputEvent):
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * 0.01)
			rotate_object_local(Vector3(1,0,0), -event.relative.y * 0.01)

	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _physics_process(delta):
	
	input_dir = Vector3.ZERO
	
	if (Input.is_key_pressed(Key.KEY_A)):
		input_dir += Vector3.LEFT
	if (Input.is_key_pressed(Key.KEY_D)):
		input_dir += Vector3.RIGHT
	if (Input.is_key_pressed(Key.KEY_SPACE)):
		input_dir += Vector3.UP
	if (Input.is_key_pressed(Key.KEY_CTRL)):
		input_dir += Vector3.DOWN
	if (Input.is_key_pressed(Key.KEY_W)):
		input_dir += Vector3.FORWARD
	if (Input.is_key_pressed(Key.KEY_S)):
		input_dir += Vector3.BACK
	
	
	var direction = (transform.basis * Vector3(input_dir.x, input_dir.y, input_dir.z)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	move_and_slide()
