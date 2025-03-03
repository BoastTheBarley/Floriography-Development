class_name JournalManager extends Control
## Manages communication between [PageViewController] and [PageTracker]. 
## Gets information from [GameManager].
##
## Will detect condition for new flower to be added to journal. 
## Will determine how many pages are available if that value is varyable.
## Will contain JournalPage array which contains each page of journal.
## Will manage transition between pages in journal.

# JournalPage will manage FlowerData
## Pages contained in [JournalManager].
@export var page_tracker: PageTracker
@export var page_view_controller: PageViewController

func _ready() -> void:
	page_view_controller.connect("start_flipping", Callable(page_tracker, "begin_flip"))
	page_view_controller.connect("end_flipping", Callable(page_tracker, "end_flip"))
	
	page_tracker.connect("change_pages", Callable(page_view_controller, "change_pages"))


### Tracks left page number
#var left_page_number: int:
	#get:
		#return left_page_number
	#set(val):
		#left_page_number = val
		#_left_page.set_page_number(left_page_number)
### Tracks right page number
#var right_page_number: int:
	#get:
		#return right_page_number
	#set(val):
		#right_page_number = val
		#_right_page.set_page_number(right_page_number)

#func _ready() -> void:
	#page_flipper.connect("flip_page", Callable(self, "flip_page"))
	#
	#left_page_number = 1
	#right_page_number = 2
	#get_page_numbers()
#
#func _process(delta: float) -> void:
	#process_page_flip()
#
#func process_page_flip() -> void:
	#var flip_direction = Input.get_axis("flip_left", "flip_right")
	#if flip_direction != 0:
		#page_flipper.start_flipping(flip_direction)
	#else:
		#page_flipper.end_flipping()
#
#func flip_page(flip_direction: float) -> void:
	#left_page_number = clampf(left_page_number + (2 * flip_direction), 1, num_pages - 1)
	#right_page_number = left_page_number + 1
#
## Test function
#func get_page_numbers() -> void:
	#print("showing pages " + str(left_page_number) + " and " + str(right_page_number))
