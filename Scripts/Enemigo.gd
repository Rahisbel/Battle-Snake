extends RigidBody2D

signal col

export var min_speed = 250  # min velocidad
export var max_speed = 300 #max velocidad

var velocity
var rotacion
var cantidad
var enemigo = ["1"]   # nombre del frame 

func _ready(): # en caso de tener diferentes tipos de enemigos
	#$AnimatedSprite.animation = enemigo[randi() % enemigo.size()]
	pass

func _on_Enemigo_body_entered(body):
	hide()
	emit_signal("col") # colision del disparo con el enemigo
	$CollisionShape2D.set_deferred("disabled", true) # esto evita que la señal se emita varias veces

func _on_VisibilityNotifier2D_screen_exited(): 
	queue_free() #Elimina los enemigos al salir de la pantalla

