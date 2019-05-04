extends Node
export (PackedScene) var Enemigo
export (PackedScene) var Disparo
var score
var maxEnem = 4
var enemigos = []
var cantEnemigos = 0
var prueba = 0
var speedE= 250 #Velocidad enemigo


func _ready():
	enemigos.resize(maxEnem)
	randomize() # genera números aleatorios
	new_game()

func game_over():
    #$ScoreTimer.stop()
    #$TimerEnemigo.stop()
    pass

func _on_TimerEnemigo_timeout():
	if cantEnemigos < maxEnem :
		$Path2D/PathFollow2D.set_offset(randi())
		var enem = Enemigo.instance()
		add_child(enem)
		enemigos[cantEnemigos] = enem
		var direction = $Path2D/PathFollow2D.rotation + PI / 2
		enem.position = $Path2D/PathFollow2D.position
		direction += rand_range(-PI / 4, PI / 4)
		enem.rotation = direction
		enem.linear_velocity = Vector2(rand_range(enem.min_speed, enem.max_speed), 0)
		enem.linear_velocity = enem.linear_velocity.rotated(direction)
		print(direction)
		cantEnemigos+=1


func new_game():
    score = 0
    $Jugador.start($Position2D.position)
    $Inicio.start()

func _on_Inicio_timeout():
    $TimerEnemigo.start()

func _on_Jugador_disparo(direccion, localizacion,velocidad):
    var b = Disparo.instance()
    add_child(b)
    b.rotation = direccion
    b.position = localizacion
    b.linear_velocity = velocidad * 3

func _on_Jugador_localizacion(posicion,direccion):
	var a
	var b
	var porcA
	var porcB
	if cantEnemigos > 1:		
		for j in enemigos:
#			print(j.velocity)
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