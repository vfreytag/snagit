extends Node

var active_phrase = null
var current_letter_index: int = -1

func activate_phrase(typed_character: String):
	var prompt = $Phrase.get_prompt()
	if prompt.substr(0,1) == typed_character:
		active_phrase == $Phrase
		print ("Phrase Active")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		@warning_ignore("unused_variable")
		var key_typed = PackedByteArray([typed_event.unicode]).get_string_from_utf8()
		
		if activate_phrase() == null:
			activate_phrase(key_typed)
	
		
		
		
