extends Area2D

#warning-ignore:unused_signal
signal hit
signal disparo(direccion,localizacion,velocidad) # información de jugador para disparo
signal cuerpo(direccion,localizacion,velocidad) # Prueba, no hace nada por ahora
signal localizacion(posicion,direccion) # información para la persecusion
signal health
#warning-ignore:unused_signal
signal vida

export var speed = 350 # velocidad del jugador
export (float) var velocidad_rot = 4.0

#warning-ignore:unused_class_variable
var bala = preload("res://Escenas/Disparo.tscn")
#warning-ignore:unused_class_variable
var cuerpo = preload("res://Escenas/Cuerpo.tscn")

var direccion_rot = 0
var screen_size  # tamaño de ventana
var velocity 
var max_health = 100
#warning-ignore:unused_class_variable
var health = max_health
#warning-ignore:unused_class_variable
var vida = 0
var left  = false
var shots = false
var right = false

func _ready():
		screen_size = get_viewport_rect().size
   
func _process(delta):
	direccion_rot = 0  
	velocity = Vector2(0,speed).rotated(rotation)  # Velocidad del jugador

	if Input.is_action_pressed("ui_right") or right: # rotacion a la der
		direccion_rot+= 1  
	
	if Input.is_action_pressed("ui_left") or left: # rotacion a la izq
		direccion_rot-= 1  
 
	if Input.is_action_just_pressed("ui_up") or shots:
		emit_signal("disparo", rotation, position,velocity) 

	if velocity.length() > 0:
		$AnimatedSprite.play()

	else:
		$AnimatedSprite.stop()

	rotation+=direccion_rot*velocidad_rot*delta
	position += velocity * delta
	emit_signal("localizacion",position,rotation)
   
	# Evita que se salga de la pantalla
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	# Detecta la colisión del enemigo
func _on_Jugador_body_entered(body):
	max_health -= 2;
	emit_signal("health",max_health)
	if max_health == 0:
		emit_signal("vida",max_health) # esto emite una señal al main para saber que ya perdió

func start(pos): # cuando comience un juego nuevo
	position = pos
	show()
	$CollisionShape2D.disabled = false

# funciones del touch
func _on_left_pressed():
	left = true

func _on_shots_pressed():
	shots = true

func _on_right_pressed():
	right = true

func _on_left_released():
	left = false

func _on_shots_released():
	shots = false

func _on_right_released():
	right = false


