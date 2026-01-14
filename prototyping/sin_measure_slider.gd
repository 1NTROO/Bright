extends ProgressBar

@export var ThisSin: String

var start_value: float = 0
var target_value: float = 0
var lerp_speed: float = 0

@export var BadColour: Color = Color(1, 0, 0, 1)
@export var GoodColour: Color = Color(1, 1, 1, 1)

var value_is_changing: bool = false

func _ready() -> void:
	GlobalSinManager.sin_value_change.connect(on_sin_value_change)
	value = GlobalSinManager.SinDictionary[ThisSin] 
	
func _process(delta: float) -> void:
	colour_changer()

	if (value_is_changing):
		lerp_speed += delta
		value = lerpf(start_value, target_value, lerp_speed)
		if (start_value < target_value && value > target_value - 0.1 
			|| start_value > target_value && value < target_value + 0.1): stop_value_change()

func on_sin_value_change(sin: String, new_value: float) -> void:
	if (sin != ThisSin): return
	start_value = value
	target_value = new_value
	value_is_changing = true

func stop_value_change() -> void:
	value = target_value
	start_value = 0
	target_value = 0
	lerp_speed = 0
	value_is_changing = false
	
func colour_changer() -> void:
	var percent_value = value / 100
	var bar_colour = (BadColour * percent_value) + (GoodColour * (1 - percent_value))
	modulate = bar_colour
	
