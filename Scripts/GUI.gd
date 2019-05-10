extends MarginContainer

onready var number_label = $HBoxContainer/barras/barra/contador/fondo/numero
onready var bar = $HBoxContainer/barras/barra/progreso
onready var tween = $Tween

func _ready():
	 #var jugador_max_health = $"../Characters/Jugador".max_health
	 #bar.max_value = jugador_max_health
	 pass 

func _on_Jugador_health(player_health):
	actualizar_health(player_health)
	pass 
	
func actualizar_health(new_value):
	number_label.text = str(new_value)
	bar.value = new_value