class_name JournalManager extends Control
## Manages journal scene and [JournalPage]s
##
## Will detect condition for new flower to be added to journal. 
## Will determine how many pages are available if that value is varyable.
## Will contain JournalPage array which contains each page of journal.
## Will manage transition between pages in journal.

# JournalPage will manage FlowerData
## Pages contained in [JournalManager].
# Breaks test when odd, will fix when using array
@export var num_pages: int = 6
var pages: Array[JournalPage]
@export var current_left_page: JournalPage
@export var current_right_page: JournalPage

# Test variables
var current_left_page_number: int:
	get:
		return current_left_page_number
	set(val):
		current_left_page_number = val
		current_left_page.set_page_number(current_left_page_number)

var current_right_page_number: int:
	get:
		return current_right_page_number
	set(val):
		current_right_page_number = val
		current_right_page.set_page_number(current_right_page_number)

func _ready() -> void:
	current_left_page_number = 1
	current_right_page_number = 2
	get_page_numbers()

func _process(delta: float) -> void:
	# Detect page flip input
	if Input.is_action_just_pressed("flip_left") or Input.is_action_just_pressed("flip_right"):
		# Pass input axis to flip_page
		# -1 when pressing flip_left button, 1 when pressing flip_right button
		flip_page(Input.get_axis("flip_left", "flip_right"))

# TO-DO: Detect when the beginning or end of journal has been reached
## Prototype flip_page. Flips page based on [param direction]. Positive is to the right.
func flip_page(direction: int) -> void:
	# Go back in field journal, move to the left
	if direction < 0:
		print("flipping left")
		flip_left()
	# Go forward in field journal, move to the right
	elif direction > 0:
		print ("flipping right")
		flip_right()
	get_page_numbers()

func flip_left() -> void:
	if current_left_page_number > 1:
		current_left_page_number -= 2
		current_right_page_number -= 2
	else:
		current_left_page_number = num_pages - 1
		current_right_page_number = num_pages

func flip_right() -> void:
	if current_left_page_number < num_pages - 2:
		current_left_page_number += 2
		current_right_page_number += 2
	else:
		current_left_page_number = 1
		current_right_page_number = 2

# Test function
func get_page_numbers() -> void:
	print("showing pages " + str(current_left_page_number) + " and " + str(current_right_page_number))
