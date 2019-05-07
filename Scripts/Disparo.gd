extends RigidBody2D
var velocity
var direccion_rot = 0
var velocidad_rot = 4.0
var speed = 400

func _ready():
	pass 

func _process(delta):
	direccion_rot = 0
	velocity = Vector2(0,speed).rotated(rotation)
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited(): 
	queue_free() #Elimina los disparos al salir de la pantalla

