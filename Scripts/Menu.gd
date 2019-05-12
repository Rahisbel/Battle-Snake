extends CanvasLayer

signal Start

func _ready():
	pass 

func mensaje(text):
	$Mensaje.text = text
	$Mensaje.show() 
	$tiempo.start()
	pass

func game_over():
	mensaje("GAME OVER")
	yield($tiempo,"timeout")
	$start.show()
	$Mensaje.text = "Battle Snake"
	$Mensaje.show()
	
func _on_start_pressed():
	$start.hide()
	emit_signal("Start")

func _on_tiempo_timeout():
	$Mensaje.hide()
