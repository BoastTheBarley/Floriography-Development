extends Panel

#@onready var fullscreen = $Fullscreen_Button


func _on_fullscreen_button_pressed():
	#error Embedded window only supports windowed mode
	if true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
