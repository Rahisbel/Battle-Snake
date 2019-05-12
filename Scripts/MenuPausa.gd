extends Node

export (PackedScene) var Main
var back = false

func _ready():
	pass 

func _process(delta):
	if Input.is_action_just_pressed("back") or back:
		print("back")
		get_tree().change_scene_to(Main)

func _on_volver_pressed():
	back = true
	
func _on_volver_released():
	back = false
