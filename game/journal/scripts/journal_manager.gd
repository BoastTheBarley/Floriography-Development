class_name JournalManager extends Node2D
## Manages journal scene and [JournalPage]s
##
## Will detect condition for new flower to be added to journal. 
## Will determine how many pages are available if that value is varyable.
## Will contain JournalPage array which contains each page of journal.
## Will manage transition between pages in journal.

# JournalPage will manage FlowerData
## Pages contained in [JournalManager].
var pages: Array[JournalPage]
var current_left_page: JournalPage
var current_right_page: JournalPage

# TO-DO: Detect when the beginning or end of journal has been reached
## Prototype flip_page. Flips page based on [param direction]. Positive is to the right.
func flip_page(direction: int) -> void:
	# Go back in field journal, move to the left
	if direction < 0:
		# Set the current left and right pages to the page two to the left
		current_left_page = pages[pages.find(current_left_page) - 2]
		current_right_page = pages[pages.find(current_right_page) - 2]
	# Go forward in field journal, move to the right
	elif direction > 0:
		# Set the current left and right pages to two to the right
		current_left_page = pages[pages.find(current_left_page) + 2]
		current_right_page = pages[pages.find(current_right_page) + 2]
