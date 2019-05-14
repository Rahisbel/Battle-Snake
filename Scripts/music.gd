extends AudioStreamPlayer

var pause = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("music") or pause:
		AudioStreamPlayer.PAUSE_MODE_PROCESS
	pass

func _on_music_pressed():
	pause = true

func _on_music_released():
	pause = false
