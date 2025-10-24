extends AnimationPlayer

func _process(delta: float) -> void:
	if Global.health <= 45:
		play("eye/eye_open-25") 
