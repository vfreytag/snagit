extends Sprite3D


@onready var prompt = $RichTextLabel
@onready var prompt_text = $RichTextLabel.text


func get_prompt() -> String:
	return prompt_text
