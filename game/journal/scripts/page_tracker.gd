class_name PageTracker extends Control

## Signal that pages displaying need to be updated.
signal change_pages(left: JournalPage, right: JournalPage)

## [PageFlipper] attached to [PageTracker].
@export var page_flipper: PageFlipper
## Number of pages in Journal.
@export var num_pages: int = 69:
	get:
		return num_pages
	set(val):
		if val % 2 != 0:
			val += 1
		num_pages = val
## Contains all pages in Journal.
var pages: Array[JournalPage]
## Tracks the left page number currently displaying.
var current_left_page_num: int = 1:
	get:
		return current_left_page_num
	set(val):
		if val > 0:
			current_left_page_num = val
			current_right_page_num = current_left_page_num + 1
## Tracks the right page number currently displaying.
var current_right_page_num: int = 2

func _ready() -> void:
	num_pages = num_pages
	page_flipper.connect("flip_page", Callable(self, "flip_page"))
	for i in range(num_pages):
		pages.append(JournalPage.new())
		pages.back().page_number = i + 1

## Updates page numbers and signals [PageViewController] about which pages to display.
func flip_page(direction: float) -> void:
	if direction > 0:
		_flip_left()
	else:
		_flip_right()

func _flip_left() -> void:
	if current_left_page_num >= num_pages - 1:
		current_left_page_num = 1
	else:
		current_left_page_num = clampf(current_left_page_num + 2, 1, num_pages - 1)
	
	change_pages.emit(pages[current_left_page_num - 1], pages[current_right_page_num - 1])

func _flip_right() -> void:
	if current_left_page_num <= 1:
		current_left_page_num = num_pages - 1
	else:
		current_left_page_num = clampf(current_left_page_num - 2, 1, num_pages - 1)
	
	change_pages.emit(pages[current_left_page_num - 1], pages[current_right_page_num - 1])

func begin_flip(direction: float) -> void:
	page_flipper.start_flipping(direction)

func end_flip() -> void:
	page_flipper.end_flipping()
