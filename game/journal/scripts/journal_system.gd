class_name JournalSystem extends Control
## Manages communication between [PageViewController] and [PageTracker]. 
## Gets information from [GameManager].
##
## Will detect condition for new flower to be added to journal. 
## Will determine how many pages are available if that value is varyable.
## Will contain JournalPage array which contains each page of journal.
## Will manage transition between pages in journal.

# JournalPage will manage FlowerData
## Pages contained in [JournalSystem].
@export var page_tracker: PageTracker
@export var page_view_controller: PageViewController

func _ready() -> void:
	page_view_controller.connect("start_flipping", Callable(page_tracker, "begin_flip"))
	page_view_controller.connect("end_flipping", Callable(page_tracker, "end_flip"))
	
	page_tracker.connect("change_pages", Callable(page_view_controller, "change_pages"))
