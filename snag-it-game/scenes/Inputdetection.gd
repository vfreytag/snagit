extends Node3D


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		@warning_ignore("unused_variable")
		var key_typed = PackedByteArray([typed_event.unicode]).get_string_from_utf8()
		print(event.as_text())
	
