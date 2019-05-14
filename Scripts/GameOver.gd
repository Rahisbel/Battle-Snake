extends Node

export (PackedScene) var Main
export (PackedScene) var Menu

var press = false

func _ready():
	pass # Replace with function body.

func _on_PlayAgain_pressed(): # jugar de nuevo
	#get_node("/root/global").ir_escena("res://scene_b.scn")
	get_node("/root/Global").ir_escena(Main)
	press = true

func _on_Menu_pressed(): # volver al menu
	press = true

func _on_Leave_pressed(): # salir
	get_tree().quit()
