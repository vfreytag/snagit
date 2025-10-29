extends Node2D

var word_key = ""
var input_key = ""

var test_store_words = {
	"Bees": "^B(?:e(?:e(?:s)?)?)?$",
	"Lollypop": "^L(o(l(l(y(p(o(p)?)?)?)?)?)?)?$",
	#"Clearly you do not own an airfryer": "^C(l(e(a(r(l(y( (y(o(u( (d(o( (n(o(t( (o(w(n( (a(n( (a(i(r(f(r(y(e(r)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?)?$",
	"Chinchilla": "^C(h(i(n(c(h(i(l(l(a)?)?)?)?)?)?)?)?)?$",
	"Bunny": "^B(u(n(n(y)?)?)?)?$",
	"Oatmilk": "O(a(t(m(i(l(k)?)?)?)?)?)?$",
	"Biscuits": "B(i(s(c(u(i(t(s)?)?)?)?)?)?)$",
	"Catfood": "C(a(t(f(o(o(d)?)?)?)?)?)?$",
	"Alien": "A(l(i(e(n)?)?)?)?$"
}

func pick_random(test_store_words):
	word_key = test_store_words.keys().pick_random()
	input_key = test_store_words[word_key]
	print(word_key)
	print(test_store_words[word_key])
	return [word_key, test_store_words[word_key]]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.health = 60
	pick_random(test_store_words)
	print(word_key)
	$Label.set_text(word_key)
	$TextEdit.set_text("")
	
func _process(delta: float) -> void:
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://scenes/death.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var regex: RegEx =  RegEx.new()
		regex.compile(input_key)
		for valid_character in regex.search_all($TextEdit.text):
			Global.health +=1
			print("yay")
			print(Global.health)
		print(Global.health)
		Global.health -=1
		if $TextEdit.text == word_key:
			print("win")
			Global.highscore = Global.highscore +1
			print (Global.highscore)
			_ready()
			$Label2.set_text(str(Global.highscore))
			
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/start.tscn")
