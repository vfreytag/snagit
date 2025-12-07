extends Node3D

@onready var interactable: Area3D = $RigidBody3D/CollisionShape3D/MeshInstance3D/Interactable
#@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
#if interactable.is_interactable == true:
		interactable.is_interactable = false
		#print("the player gained milk")
		Global.word_key = $RigidBody3D/CollisionShape3D/MeshInstance3D/Interactable.item_name
		Global.input_key = $RigidBody3D/CollisionShape3D/MeshInstance3D/Interactable.item_regex
		print(Global.word_key)
		print(Global.input_key)
		open_overlay()
		
func open_overlay():
	print("hi i'm an overlay")
	pass
