extends Node


func  _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		go_to_escp_menu()

func go_to_escp_menu():
	get_tree().change_scene_to_file("res://game/scenes/escp_menu_.tscn")
	

#Global Dictionaries
var flower_status = {
	
}

var pot_status = {
	
}

var player_information = {
	"name" : "",
	"day": 0,
	"brightness": 1
}

var player_relationship = {
	
}

var player_choices = {
	
}

var inventory = {
	
}

#include a dictionary for game textures to call anywhere maybe?


#Saving And Loading Data
#user:// directory saves game data on pc files after game closes
var save_path = "user://player_data_last_saved.save"

func save_player_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(Global_Values.player_information["name"])
	file.store_var(Global_Values.player_information["day"])
	file.store_var(Global_Values.player_information["brightness"])
	
	#tester
	print("succesfully saved player_data", Global_Values.player_information["brightness"])
	#tester

func load_player_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global_Values.player_information["name"] = FileAccess.get_file_as_string(Global_Values.player_information["name"])
		Global_Values.player_information["day"] = file.get_var(Global_Values.player_information["day"])
		Global_Values.player_information["brightness"] = file.get_var(Global_Values.player_information["brightness"])
	else:
		print("no data saved")
		Global_Values.player_information["name"] = ""
		Global_Values.player_information["day"] = 0
		Global_Values.player_information["brightness"] = 1
	
	#tester
	print("succesfully loaded player_data", Global_Values.player_information["brightness"])
	#tester
