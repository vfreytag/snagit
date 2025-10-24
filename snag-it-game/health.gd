class_name Health
extends Node

func _init():
	print("start")


func _on_timer_timeout():
	Global.health -= 1
	print(Global.health)
	
func _physics_process(delta: float) -> void:
	if Global.health <= 60 && Global.health > 45:
		Global.fullhealth == true
		print("fullhealth is true")
	if Global.health <= 45 && Global.health > 30:
		Global.threequathealth == true
		Global.fullhealth == false
		print("threequathealth is true")
	if Global.health <= 30 && Global.health > 15:
		Global.threequathealth == false
		Global.halfhealth == true
		print("halfhealth is true")
	if Global.health <= 15 && Global.health > 5:
		Global.halfhealth == false
		Global.quathealth == true
		print("quathealth is true")
	if Global.health <= 5:
		Global.nohealth == true
		Global.quathealth == false
		print("nohealth is true")
