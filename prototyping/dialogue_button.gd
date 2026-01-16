class_name DialogueButton

extends Button

@onready var DialogueOption = $"../.."
@export var Dict: Dictionary

func _ready() -> void:
	Dict.clear()

func set_values(mod: String, val: float) -> void:
	Dict.get_or_add(mod, val)

func _pressed() -> void:
	for sin in Dict:
		GlobalSinManager.change_value(sin, Dict[sin])
	DialogueOption.on_press()
