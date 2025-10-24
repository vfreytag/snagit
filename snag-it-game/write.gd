extends TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var regex: RegEx =  RegEx.new()
		regex.compile("^B(?:e(?:e(?:s)?)?)?$")
		for valid_character in regex.search_all(text):
			Global.health +=1
			print("yay")
			print(Global.health)
		print(Global.health)
		Global.health -=1
		if text == "Bees":
			print("win")
	#pass
