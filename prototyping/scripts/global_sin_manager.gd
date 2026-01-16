extends Node

@export var SinDictionary = { 
	"Lust": 50, 
	"Gluttony": 50, 
	"Greed": 50, 
	"Sloth": 50, 
	"Wrath": 50, 
	"Envy": 50, 
	"Pride": 50
}

var ActiveInteractible: Node2D

@export var ActiveLevel: LevelManager

signal sin_value_change(sin, value)

func change_value(sin: String, val: float) -> void:
	SinDictionary[sin] += val
	sin_value_change.emit(sin, SinDictionary[sin])

func end_interaction(option: int) -> void:
	ActiveInteractible.dialogue_visibility(false)
	if option != 2:
		ActiveInteractible.visible = false
	ActiveInteractible = null

func correct_option() -> void:
	ActiveLevel.set_current_state(ActiveLevel.get_current_state() - 1)
	
