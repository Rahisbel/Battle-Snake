extends RigidBody2D

var speed = 200
var direccion
var velocidad

func _ready():
	pass

func _process(delta):
	direccion= 0
	velocidad = Vector2(0,speed).rotated(rotation)
	position += velocidad * delta
	
	# esto no hace nada, la idea es crear un script que persiga el jugador
	# asi como lo hace el enemigo, y que vaya aumentando conforme pasa de nivel
	# sigo echandole cabeza porque no sé puede hacer tal cual como la persecusion 
	# hecha en main.
	