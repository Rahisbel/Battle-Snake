extends Node

var pausa = false

func _ready():
	$Label.visible = false

func _process(delta):
	pass
	if Input.is_action_just_pressed("pause") or pausa:
		if get_tree().paused == false:
			get_tree().paused = true
			$Label.visible = true
		else:
			get_tree().paused = false
			$Label.visible = false
			_on_pause_released()

func _on_pause_pressed():
	pausa = true

func _on_pause_released():
	pausa = false
