extends Panel

#@onready var fullscreen = $Fullscreen_Button


func _on_fullscreen_button_pressed():
	print("Called")
	if true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
