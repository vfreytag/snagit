extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.highscore == 0
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$TextEdit.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
		if $TextEdit.text == "Play":
			print("win")
			get_tree().change_scene_to_file("res://tester_store.tscn")
		if $TextEdit.text == "Quit":
			print("end")
			$Label.text == "Byebye"
			get_tree().quit()
			return
			
