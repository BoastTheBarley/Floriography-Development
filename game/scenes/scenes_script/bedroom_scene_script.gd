extends Node2D


func _on_journal_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/journal/Journal.tscn")


func _on_bed_button_pressed() -> void:
	Global_Values.player_information["day"] = Global_Values.player_information["day"] + 1
	Global_Values.save_player_data()
	print("Day: ",Global_Values.player_information["day"])
