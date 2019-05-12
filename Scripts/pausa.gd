extends Node

export (PackedScene) var MenuPausa

var pausa = false

func _ready():
	$Label.visible = false

func _process(delta):
	if Input.is_action_just_pressed("pause") or pausa:
		if get_tree().paused == false:
			get_tree().paused = true
			$Label.visible = true
			#get_tree().change_scene_to(MenuPausa)
		else:
			get_tree().paused = false
			$Label.visible = false
			_on_pause_released()

func _on_pause_pressed():
	pausa = true

func _on_pause_released():
	pausa = false
