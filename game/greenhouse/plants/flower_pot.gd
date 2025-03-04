class_name FlowerPot extends Node2D
## Tracks days flower has been growing 

## [FlowerData] being grown in pot.
@export var flower_growing: FlowerData
## Days flower has been watered.
var days_watered: int = 0
## Days flower has gone without water.
var days_without_water: int = 0
## Tracks if pot has been watered during current day.
var watered: bool = false

func _ready() -> void:
	GameManager.connect("change_day", Callable(self, "end_day"))

func water() -> void:
	watered = true
	days_watered += 1
	days_without_water = 0
	if flower_growing.days_to_grow == days_watered:
		grow_flower()

func grow_flower() -> void:
	print("flower has grown")

func wilt_flower() -> void:
	print("flower has wilted")

func end_day() -> void:
	if not watered:
		days_without_water += 1
	if flower_growing.days_until_dehydration == days_without_water:
		wilt_flower()
	watered = false
