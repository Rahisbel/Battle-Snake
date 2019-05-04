extends Area2D
signal hit
signal disparo(direccion,localizacion,velocidad)
signal localizacion(posicion,direccion)

export var speed = 250 # velocidad del jugador
export (float) var velocidad_rot = 4.0
var bala = preload("res://Escenas/Disparo.tscn")
var screen_size  # tamaño de ventana
var direccion_rot = 0
var velocity 

func _ready():
    screen_size = get_viewport_rect().size
   
func _process(delta):
    direccion_rot = 0  
      # Velocidad del jugador
    velocity = Vector2(0,speed).rotated(rotation)

    if Input.is_action_pressed("ui_right"): # rotacion a la der
        direccion_rot+= 1  

    if Input.is_action_pressed("ui_left"): # rotacion a la izq
        direccion_rot-= 1   
    if Input.is_action_just_pressed("ui_up"):
        emit_signal("disparo", rotation, position,velocity)  

    if velocity.length() > 0:
        #velocity = velocity.normalized() * speed
        $AnimatedSprite.play()
    else:
        $AnimatedSprite.stop()

    rotation+=direccion_rot*velocidad_rot*delta
    position += velocity * delta
    emit_signal("localizacion",position,rotation)
   
    # Evita que se salga de la pantalla
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)

# Detecta la colisión
func _on_Jugador_body_entered(body):
    #hide() esconde el jugador cuando colisiona
    emit_signal("hit")  # emite la señal de la colisión
    $CollisionShape2D.set_deferred("disabled", true) # esto evita que la señal se emita varias veces

func start(pos): # cuando comience un juego nuevo
    position = pos
    show()
    $CollisionShape2D.disabled = false

