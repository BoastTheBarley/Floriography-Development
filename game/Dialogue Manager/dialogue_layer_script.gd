extends CanvasLayer

@export var dialogue_data = "res://game/Dialogue Manager/Assets/Json Dialogue/dialogue_data.json"

var scene_text = {}
var selected_text = []
var is_dialogue_active = false
var area_active = false
var portrait_tween: Tween = null

@onready var background: TextureRect = $Dialogue_Container/Background
@onready var text: RichTextLabel = $Dialogue_Container/Text
@onready var portrait: TextureRect = $Portrait

func _ready():
	set_process_input(true)
	background.visible = false
	text.visible = false
	portrait.visible = false
	scene_text = load_scene_text()
	#tester - print(scene_text)


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
				#tester - print(text_data)  # Prints the dictionary
				return text_data
			else:
				print("Unexpected data, expected a dictionary.")
		else:
			print("JSON Parse Error: ", json.get_error_message(), " in ", dialogue_data, " at line ", json.get_error_line())
	else:
		print("Failed to open dialogue file.")
		return {}

func show_scene_text():
	if selected_text.is_empty():
		finish()
		return
	
	var entry = selected_text.pop_front()
	
	# Handle dictionary format
	if typeof(entry) == TYPE_DICTIONARY:
		text.text = entry.get("Line", "")
	
	#------------Character Portraits-----------------------
	if entry.has("Person"):
		match entry["Person"]:
			"1":
				portrait.texture = load("res://placeholder_textures/icon.svg")
			"2":
				portrait.texture = load("res://placeholder_textures/bed placeholder.png")
			_:
				portrait.visible = false
	else:
		portrait.visible = false
		print("No Portrait Found")
	if portrait.visible == false:
		fade_in_portrait()
	#------------Character Portraits-----------------------

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
	fade_out_portrait()

func _on_display_dialogue(text_key):
	if is_dialogue_active:
		next_line()
	else:
		background.visible = true
		text.visible = true
		is_dialogue_active = true
		#tester - print(scene_text[text_key])
		selected_text = scene_text[text_key].duplicate()
		show_scene_text()

# When Player Has Mouse In Dialogue Box They Can Click To Next Line, Dialogue Continues When In Area And Clicked
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and is_dialogue_active:
		#tester - print("event detected")
		next_line()


func _on_summon_customer_pressed() -> void:
	if not is_dialogue_active:
		var day = str(Global_Values.player_information["day"])
		var stage = str(Global_Values.player_information["dialogue_stage"])
		var dialogue_key = day + "." + stage
		if dialogue_key in scene_text:
			_on_display_dialogue(dialogue_key)
			Global_Values.player_information["dialogue_stage"] = Global_Values.player_information["dialogue_stage"] + 1
		else:
			print("No More Dialogue")
		#tester - print(Global_Values.player_information["dialogue_stage"])

func fade_in_portrait(duration := 1.5):
	portrait.visible = true
	portrait.modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(portrait, "modulate:a", 1, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func fade_out_portrait(duration := 1.5):
	var tween = create_tween()
	tween.tween_property(portrait, "modulate:a", 0.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.finished.connect(func ():
		portrait.visible = false
	)

func _on_background_mouse_entered() -> void:
	area_active = true


func _on_background_mouse_exited() -> void:
	area_active = false
