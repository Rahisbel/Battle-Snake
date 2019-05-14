extends CanvasLayer

export (PackedScene) var Main
signal Start

func _ready():
	pass 

func mensaje(text):
	$Mensaje.text = text
	$Mensaje.show() 
	pass

func game_over():
	mensaje("GAME OVER")
	#yield($tiempo,"timeout")
	$start.show()
	$Mensaje.text = "Battle Snake"
	$Mensaje.show()
	
func _on_start_pressed():
	get_tree().change_scene_to(Main)

func _on_leave_pressed():
	get_tree().quit()
