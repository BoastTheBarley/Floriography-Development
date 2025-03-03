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

func _process(delta: float) -> void:
	if flipping:
		time_since_flip += delta
		
		# Decrease time_between_flips while key is being held
		time_between_flips = move_toward(time_between_flips, MIN_TIME_BETWEEN_FLIPS, 0.01)

## Controls page flip speed logic.
func start_flipping(flip_direction: float) -> void:
	# Flip immediately on first frame of key press
	# Otherwise flip after time_between_flips intervals
	if not flipping or time_since_flip >= time_between_flips:
		flipping = true
		time_since_flip = 0
		flip_page.emit(flip_direction)

## Resets values once flipping stops.
func end_flipping() -> void:
	flipping = false
	time_between_flips = MAX_TIME_BETWEEN_FLIPS
