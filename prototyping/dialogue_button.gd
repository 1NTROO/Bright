extends Button

@export var Dict: Dictionary

func _pressed() -> void:
	for sin in Dict:
		GlobalSinManager.change_value(sin, Dict[sin])
		
	GlobalSinManager.end_interaction()
