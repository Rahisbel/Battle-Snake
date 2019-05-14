extends Node

var escena_actual = null

func _ready():
	var raiz = get_tree().get_root()
	escena_actual = raiz.get_child(raiz.get_child_count() - 1)
	
func ir_escena(camino):
	call_deferred("ir_escena_diferida",camino)

func ir_escena_diferida(camino):
	#escena_actual.free()
	var s = ResourceLoader.load(camino)
	escena_actual = s.instance()
	get_tree().get_root().add_child(escena_actual)
	get_tree().set_current_scene(escena_actual)