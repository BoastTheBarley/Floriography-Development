extends Button


func _on_pressed() -> void:
	#reset will do better method later
	Save_data.player_data.name = ""
	Save_data.player_data.day = 0
	get_tree().change_scene_to_file("res://game/scenes/customer_scene.tscn")
	
