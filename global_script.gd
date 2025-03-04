extends Node


func  _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		go_to_escp_menu()

func go_to_escp_menu():
	get_tree().change_scene_to_file("res://scenes/escp_menu_.tscn")
	
