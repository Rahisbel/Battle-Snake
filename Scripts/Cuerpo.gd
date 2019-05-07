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