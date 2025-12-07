extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var _last_movement_direction := Vector3.BACK

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	#if Input.is_action_just_pressed("Jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY 
		#$BUNY/AnimationPlayer.play("Armature|Jump")
		#print("i'm jumoing")
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Forward", "Back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if is_on_floor():
			$BUNY/AnimationPlayer.play("Armature|Walk")
			_last_movement_direction = direction
		var target_angle := Vector3.BACK.signed_angle_to(_last_movement_direction, Vector3.UP)
		$BUNY.global_rotation.y = lerp_angle($BUNY.global_rotation.y, target_angle, 15 * delta)
		#$".".look_at(direction) #can't get it to work right... so whatever im stopping for today
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if is_on_floor():
			$BUNY/AnimationPlayer.play("Armature|Idle") #for some reason this one i fucked up the naming of... struggling to  actually edit the blender file now??? something broke i feel

	move_and_slide()
