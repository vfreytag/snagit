extends Node

@export var interact_name: String = ""
@export var is_interactable: bool = true

var interact: Callable = func():
	is_interactable = false
	pass
