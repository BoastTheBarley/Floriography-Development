extends Node

var save_path = "user://player_data_last_saved.save"

var player_data = {
	"name" : "",
	"day": 0,
	"brightness": 1
}

func save_player_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(player_data.name)
	file.store_var(player_data.day)
	file.store_var(player_data.brightness)
	
func load_player_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		player_data.name = FileAccess.get_file_as_string(player_data.name)
		player_data.day = file.get_var(player_data.day)
		player_data.brightness = file.get_var(player_data.brightness)
	else:
		print("no data saved")
		player_data.name = ""
		player_data.day = 0
		player_data.brightness = 1
