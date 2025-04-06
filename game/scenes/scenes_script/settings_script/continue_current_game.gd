extends Button



func _on_pressed():
	Save_data.load_player_data()
	GlobalWorldEnvironment.environment.adjustment_brightness = Save_data.player_data.brightness
	get_tree().change_scene_to_file("res://scenes/customer_scene.tscn")
