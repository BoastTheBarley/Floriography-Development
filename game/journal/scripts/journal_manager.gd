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
@export var num_pages: int = 3
var pages: Array[JournalPage]
@export var _left_page: JournalPage
@export var _right_page: JournalPage

var flip_speedup_delay: float = 1
var time_since_flip: float = 0

## Tracks left page number
var left_page_number: int:
	get:
		return left_page_number
	set(val):
		left_page_number = val
		_left_page.set_page_number(left_page_number)
## Tracks right page number
var right_page_number: int:
	get:
		return right_page_number
	set(val):
		right_page_number = val
		_right_page.set_page_number(right_page_number)

func _ready() -> void:
	left_page_number = 1
	right_page_number = 2
	get_page_numbers()

func _process(delta: float) -> void:
	var flip_direction = Input.get_axis("flip_left", "flip_right")
	# Detect page flip input
	if flip_direction != 0 and (time_since_flip >= flip_speedup_delay or time_since_flip == 0):
		# Pass input axis to flip_page
		# -1 when pressing flip_left button, 1 when pressing flip_right button
		flip_page(flip_direction)
		time_since_flip = 0
	
	time_since_flip += delta

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
	# Wrap to end of journal if at the beginning
	if left_page_number <= 1:
		left_page_number = num_pages - 1
		right_page_number = num_pages
	# Flip left otherwise
	else:
		left_page_number -= 2
		right_page_number -= 2

func flip_right() -> void:
	# Wrap to the beginning of journal if at the end
	if left_page_number >= num_pages - 1:
		left_page_number = 1
		right_page_number = 2
	# Flip right otherwise
	else:
		left_page_number += 2
		right_page_number += 2

# Test function
func get_page_numbers() -> void:
	print("showing pages " + str(left_page_number) + " and " + str(right_page_number))
