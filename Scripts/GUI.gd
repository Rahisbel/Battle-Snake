extends MarginContainer

onready var number_label = $HBoxContainer/contadores/contador/fondo/numero
onready var bar = $HBoxContainer/barras/barra/progreso
onready var tween = $Tween

func _ready():
	var jugador_max_health = $"../Jugador".max_health #accede a la salud del jugador
	bar.max_value = jugador_max_health
	actualizar_health(jugador_max_health)
	pass 

func _on_Jugador_health(health): 
	actualizar_health(health)
	pass 

func actualizar_health(new_value): # actualiza la salud del jugador
	bar.value = new_value
