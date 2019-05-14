extends CanvasLayer

export (PackedScene) var Main
export (PackedScene) var Programadors
signal Start

func _ready():
	pass 

func mensaje(text):
	$Mensaje.text = text
	$Mensaje.show() 
	pass

func _on_start_pressed():
	get_tree().change_scene_to(Main)

func _on_leave_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	get_tree().change_scene_to(Programadors)
