extends CanvasLayer

export (PackedScene) var Main

func _ready():
	pass # Replace with function body.
	
func _on_volver_pressed():
	get_tree().change_scene_to(Main)
