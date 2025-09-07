extends Node2D


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/settings.tscn")


func _on_leave_menu_button_pressed() -> void:
	#Eventually change to saved "last room" player was in
	get_tree().change_scene_to_file("res://game/scenes/flower_shop.tscn")


func _on_save_game_pressed() -> void:
	Global_Values.save_player_data()
