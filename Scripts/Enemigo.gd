extends RigidBody2D
signal col

export var min_speed = 250  # min velocidad
export var max_speed = 300 #max velocidad
var velocity
var rotacion
var enemigo = ["1"]   # nombre del frame 

func _ready(): # en caso de tener diferentes tipos de enemigos
	#$AnimatedSprite.animation = enemigo[randi() % enemigo.size()]
	pass

func _process(delta):
		#velocity = Vector2(0, max_speed)
		#position += velocity * delta
		#rotacion = Vector2(0, max_speed).rotated(rotation)
		pass

func _on_Enemigo_body_entered(body):
	hide()
	emit_signal("col")
	$CollisionShape2D.set_deferred("disabled", true)



