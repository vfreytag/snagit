class_name Health
extends Node

@onready var anim = $"../Control/Steal_UI/Eye_Container/SubViewport/eye/AnimationPlayer"

func _init():
	print("start")
	
func _physics_process(delta: float) -> void:
	if Global.health == 60:
		anim.play("eye/eye_close_0")
	if Global.health == 45:
		anim.play("eye/eye_open-25")
	if Global.health == 30:
		anim.play("eye/eye_open_50")
	if Global.health == 15:
		anim.play("eye/eye_open_75")
	if Global.health == 5:
		anim.play("eye/eye_caught")


func _on_timer_timeout():
	Global.health -= 1
	print(Global.health)
	if Global.health <= 60 && Global.health > 45:
		Global.fullhealth = true
		#print("fullhealth is true")
	if Global.health <= 45 && Global.health > 30:
		Global.threequathealth = true
		Global.fullhealth = false
		#print("threequathealth is true")
	if Global.health <= 30 && Global.health > 15:
		Global.threequathealth = false
		Global.halfhealth = true
		#print("halfhealth is true")
	if Global.health <= 15 && Global.health > 5:
		Global.halfhealth = false
		Global.quathealth = true
		#print("quathealth is true")
	if Global.health <= 5:
		Global.nohealth = true
		Global.quathealth = false


	
	
	
	
		#print("nohealth is true")
