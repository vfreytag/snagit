extends Node2D

var word_key = ""
var input_key = ""

var test_store_words = {
	"Bees": "^B(?:e(?:e(?:s)?)?)?$",
	"Lollypop": "^L(o(l(l(y(p(o(p)?)?)?)?)?)?)?$",
	"Chinchilla": "^C(h(i(n(c(h(i(l(l(a)?)?)?)?)?)?)?)?)?$"
}

func pick_random(test_store_words):
	word_key = test_store_words.keys().pick_random()
	input_key = test_store_words[word_key]
	print(word_key)
	print(test_store_words[word_key])
	return [word_key, test_store_words[word_key]]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pick_random(test_store_words)
	print(word_key)
	$Label.set_text(word_key)
	$TextEdit.set_text("")

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
