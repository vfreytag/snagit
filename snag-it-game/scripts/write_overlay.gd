extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.health = 60
	#pick_random(test_store_words)
	#print(word_key)
	$Label.set_text(Global.word_key)
	$TextEdit.set_text("")
	
func _process(delta: float) -> void:
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://scenes/death.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var regex: RegEx =  RegEx.new()
		regex.compile(Global.input_key)
		for valid_character in regex.search_all($TextEdit.text):
			Global.health +=1
			print("yay")
			print(Global.health)
		print(Global.health)
		Global.health -=1
		if $TextEdit.text == Global.word_key:
			print("win")
			_ready() #must exit the overlay

			
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/start.tscn")
