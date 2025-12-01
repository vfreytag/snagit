extends Node3D

@onready var interactable: Area3D = $RigidBody3D/CollisionShape3D/MeshInstance3D/Interactable
#@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	interactable.interact = _on_interact
	
	
func _on_interact():
#	if sprite_2d.frame == 0:
#		sprite_2d.frame = 1
	if interactable.is_interactable == true:
		interactable.is_interactable = false
		print("the player gained catfood")
		
