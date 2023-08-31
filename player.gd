extends CharacterBody3D

@export var speed = 14.0
@export var jump_impulse = 20.0
@export var fall_acceleration = 75.0


func _physics_process(_delta):
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	direction = direction.normalized()
	$Pivot.look_at(position + direction, Vector3.UP)

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
