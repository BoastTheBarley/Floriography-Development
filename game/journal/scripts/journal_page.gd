class_name JournalPage extends Control
## Contains data of flower and determines how it is displayed.
##
## Manages qualities of flowers seen/unlocked.
## Can contain data on who likes flowers once given to them.
## Can contain stats on flower growth (how many grown, how many wilted, etc.)

## Flower displayed on this [JournalPage].
var flower_contained: FlowerData
@export var page_number: int

@export var page_number_label: Label

func _ready() -> void:
	page_number_label.text = str(page_number)

func set_page_number(page_number: int) -> void:
	self.page_number = page_number
	page_number_label.text = str(self.page_number)
