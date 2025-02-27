extends Button




func _on_pressed() -> void:
	#Eventually change to saved "last room" player was in
	get_tree().change_scene_to_file("res://scenes/flower_shop.tscn")
