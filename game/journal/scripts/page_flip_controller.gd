class_name PageFlipper extends Control
## Handles page flipping speed logic.

## Signals that page needs to be flipped in [param direction].
signal flip_page(direction: float)

## Lowest possible time between flips. Lower means faster flipping.
const MIN_TIME_BETWEEN_FLIPS: float = 0.05
## Highest possible time between flips. Higher means longer to register page flipping.
const MAX_TIME_BETWEEN_FLIPS: float = 1
## Tracks current time between flips. Begins at [member MAX_TIME_BETWEEN_FLIPS] and ends at [member MIN_TIME_BETWEEN_FLIPS].
var time_between_flips: float = 1
## Tracks how long since the page was flipped last.
var time_since_flip: float = 0
## True while pages are being flipped.
var flipping: bool = false
## Tracks if current page flip attempt is the first one.
var first_flip: bool = true
## Stores direction of page flip given by [JournalManager]
var flip_direction: float

func _process(delta: float) -> void:
	if flipping:
		speed_up_flipping(delta)

## Speeds up page flipping over time.
func speed_up_flipping(delta: float) -> void:
	# Track the amount of time since the last page flip
	time_since_flip += delta
	# Steadily increase flip speed over time (decrease time between flips)
	time_between_flips = move_toward(time_between_flips, MIN_TIME_BETWEEN_FLIPS, 0.01)
	
	if first_flip or time_since_flip >= time_between_flips:
		first_flip = false
		time_since_flip = 0
		flip_page.emit(flip_direction)

## Starts page flipping.
func start_flipping(flip_direction: float) -> void:
	flipping = true
	self.flip_direction = flip_direction

## Ends page flipping. Resets values for next time.
func end_flipping() -> void:
	first_flip = true
	flipping = false
	time_between_flips = MAX_TIME_BETWEEN_FLIPS
