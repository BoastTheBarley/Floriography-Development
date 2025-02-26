extends Node2D



func _on_customer_scene_button_pressed() -> void:
	get_tree().change_scene_to_file("res://customer_scene.tscn")
