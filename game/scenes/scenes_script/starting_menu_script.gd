extends Node2D


func _on_start_new_game_button_pressed() -> void:
	#reset will do better method later
	get_tree().change_scene_to_file("res://game/scenes/customer_scene.tscn")
	
	#tester
	print("successfully started new game; brightness: ",Global_Values.player_information["brightness"])
	#tester
	



func _on_continue_current_game_pressed() -> void:
	Global_Values.load_player_data()
	GlobalWorldEnvironment.environment.adjustment_brightness = Global_Values.player_information["brightness"]
	get_tree().change_scene_to_file("res://game/scenes/customer_scene.tscn")
