class_name PageViewController extends Control
## Controls input from player while in Journal and animations and display of pages.

## 
signal start_flipping(direction: float)
signal end_flipping()

@export var left_page: JournalPage
@export var right_page: JournalPage

func _process(delta: float) -> void:
	var flip_input: float = Input.get_axis("flip_left", "flip_right")
	if flip_input != 0.0:
		start_flipping.emit(flip_input)
	else:
		end_flipping.emit()

func change_pages(left_page: JournalPage, right_page: JournalPage):
	self.left_page.set_page_number(left_page.page_number)
	self.right_page.set_page_number(right_page.page_number)

func flip_page(direction: float) -> void:
	await start_flipping
	print("flipping page")
