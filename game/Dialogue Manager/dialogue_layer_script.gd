extends CanvasLayer

@export var dialogue_data = "res://game/Dialogue Manager/Assets/Json Dialogue/dialogue_data.json"

var scene_text = {}
var selected_text = []
var is_dialogue_active = false
var area_active = false

@onready var background: TextureRect = $Dialogue_Container/Background
@onready var text: RichTextLabel = $Dialogue_Container/Text

func _ready():
	set_process_input(true)
	background.visible = false
	text.visible = false
	scene_text = load_scene_text()
	print(scene_text)


func load_scene_text():
	var file = FileAccess.open(dialogue_data, FileAccess.READ)  # Open the file for reading
	if file:
		var json_text = file.get_as_text()  # Get the text content of the file
		file.close()  # Don't forget to close the file
		var json = JSON.new()  # Create a new JSON object
		var error = json.parse(json_text)  # Parse the JSON text
		if error == OK:
			var text_data = json.data  # Get the parsed data
			if typeof(text_data) == TYPE_DICTIONARY:  # Check if it’s a dictionary (JSON object)
				print(text_data)  # Prints the dictionary
				return text_data
			else:
				print("Unexpected data, expected a dictionary.")
		else:
			print("JSON Parse Error: ", json.get_error_message(), " in ", dialogue_data, " at line ", json.get_error_line())
	else:
		print("Failed to open dialogue file.")
		return {}

func show_scene_text():
	text.text = selected_text.pop_front()
	print(selected_text)

func next_line():
	if not selected_text.is_empty():
		show_scene_text()
	else:
		finish()

func finish():
	text.text = ""
	background.visible = false
	text.visible = false
	is_dialogue_active = false

func _on_display_dialogue(text_key):
	if is_dialogue_active:
		next_line()
	else:
		background.visible = true
		text.visible = true
		is_dialogue_active = true
		print(scene_text[text_key])
		selected_text = scene_text[text_key].duplicate()
		show_scene_text()

# When Player Has Mouse In Dialogue Box They Can Click To Next Line, Dialogue Continues When In Area And Clicked
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and is_dialogue_active:
		print("event detected")
		next_line()



func _on_summon_customer_pressed() -> void:
	if not is_dialogue_active:
		_on_display_dialogue("intro")


func _on_background_mouse_entered() -> void:
	area_active = true


func _on_background_mouse_exited() -> void:
	area_active = false
