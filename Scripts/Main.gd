extends Node

export (PackedScene) var Enemigo
export (PackedScene) var Disparo
export (PackedScene) var Cuerpo
export (PackedScene) var GameOver

var score
var maxEnem = 15
var cantidad
var enemigos = [] #vector de enemigos
var cantEnemigos = 0 
var speedE= 300  #Velocidad enemigo
var body 
var nivel = 1

func _ready():
	enemigos.resize(maxEnem)
	randomize() # genera números aleatorios
	new_game()

func new_game():
	score = 0
	randomize() # genera números aleatorios
	$Inicio.start()
	$Jugador.start($Position2D.position)

func _on_TimerEnemigo_timeout(): # Movimiento básico del enemigo
	if cantEnemigos < maxEnem :
		$Path2D/PathFollow2D.set_offset(randi()) # genera posiciones aleatorias 
		var enem = Enemigo.instance()
		add_child(enem)
		enemigos[cantEnemigos] = enem
		var direction = $Path2D/PathFollow2D.rotation + PI / 2 
		enem.position = $Path2D/PathFollow2D.position
		direction += rand_range(-PI / 4, PI / 4)
		enem.rotation = direction
		enem.linear_velocity = Vector2(rand_range(enem.min_speed, enem.max_speed), 0)
		enem.linear_velocity = enem.linear_velocity.rotated(direction)
		cantEnemigos+=1
		enem.cantidad = cantidad

func _on_Inicio_timeout():
	$TimerEnemigo.start()
	pass

func _on_Jugador_disparo(direccion, localizacion,velocidad): # disparos
	var b = Disparo.instance()
	add_child(b)
	b.rotation = direccion
	b.position = localizacion
	b.linear_velocity = velocidad * 3

func _on_Jugador_localizacion(posicion,direccion): # Persecusion
	var a
	var b
	var porcA
	var porcB
	if cantEnemigos > 1:		
		for j in enemigos:
			if j != null:
				a=posicion.y-j.position.y
				b=posicion.x-j.position.x
				if a<0 :
					a=a*-1
				if b<0:
					b=b*-1
				porcA=(a*100)/(a+b)
				porcB=(b*100)/(a+b)
				if posicion.x > j.position.x  && posicion.y > j.position.y:
					j.linear_velocity = Vector2(speedE*(porcB/100),speedE*(porcA/100))
				elif posicion.x < j.position.x  && posicion.y > j.position.y:
					j.linear_velocity = Vector2(-(speedE*(porcB/100)),speedE*(porcA/100))
				if posicion.y < j.position.y && posicion.x < j.position.x:
					j.linear_velocity = Vector2(-(speedE*(porcB/100)),-(speedE*(porcA/100)))
				elif posicion.y < j.position.y && posicion.x > j.position.x:
					j.linear_velocity = Vector2(speedE*(porcB/100),-(speedE*(porcA/100)))

func _on_leave_pressed(): # sale del juego
	get_tree().quit()

func _on_restart_pressed(): #reinicio, aún le falta unos detalles
	new_game()

func _on_Jugador_vida(max_health): #game over
	if max_health == 0:
		get_tree().change_scene_to(GameOver)
		#get_node("/root/Global").ir_escena("res://GameOver.scn")
		
func _nivel():
	if cantidad == 0:
		print("nivel")

func _on_music_pressed():
	if $AudioStreamPlayer.playing:
		$AudioStreamPlayer.stop()
	else:
		$AudioStreamPlayer.play()