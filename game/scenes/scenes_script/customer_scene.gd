extends Node2D



func _on_flower_shop_button_pressed():
	get_tree().change_scene_to_file("res://game/scenes/flower_shop.tscn")


func _on_bedroom_button_pressed():
	get_tree().change_scene_to_file("res://game/scenes/bedroom_scene.tscn")
