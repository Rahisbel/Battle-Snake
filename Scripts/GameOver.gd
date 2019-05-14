extends Node


var press = false

func _ready():
	pass # Replace with function body.	

func _on_PlayAgain_pressed(): # jugar de nuevo
	#get_node("/root/Global").ir_escena("res://Main.tscn")
	pass

func _on_Menu_pressed(): # volver al menu
	press = true

func _on_Leave_pressed(): # salir
	get_tree().quit()
