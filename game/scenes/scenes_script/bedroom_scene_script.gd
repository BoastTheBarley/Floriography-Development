extends Node2D


func _on_journal_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/journal/Journal.tscn")
