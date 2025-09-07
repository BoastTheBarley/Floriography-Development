extends Control
@onready var slider = $Brightness_Slider
@onready var label = $Brightness_Label
@onready var value = Global_Values.player_information["brightness"]

func _ready():
	var current_brightness = value * 50
	label.text = "%.0f%%" %current_brightness
	slider.value = value

func _on_brightness_slider_value_changed(current):
	value = current
	GlobalWorldEnvironment.environment.adjustment_brightness = value
	var current_brightness = value * 50
	label.text = "%.0f%%" %current_brightness
	slider.value = value
	Global_Values.player_information["brightness"] = value
	#tester
	print("Changed Brightness", Global_Values.player_information["brightness"])
	#tester


func _on_close_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game/scenes/escp_menu_.tscn")
