class_name Health
extends Node

func _init():
	print("start")


func _on_timer_timeout():
	Global.health -= 1
	print(Global.health)
