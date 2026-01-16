extends HBoxContainer

@export var IsMonologue: bool = false
@export var DialogueIndex: int = 0

@export var IsCorrect: bool = false

@export_subgroup("Nodes")
@export var ModifierNode: 		Control
@export var TextNode: 			Control
@export var ModifierValueNode: 	Control

@onready var ButtonChild = $"./Panel/Button"

func assign_monologue(text: String) -> void:
	TextNode.text = text

func assign_dialogue(text: String, mod: Array, val: Array, thisIsCorrect: bool = false) -> void:
	if thisIsCorrect: IsCorrect = true
	TextNode.text = text
	if IsMonologue: return
	if len(mod) != len(val): return
	for i in len(mod):
		ButtonChild.set_values(mod[i], val[i])
		
func on_press() -> void:
	if IsCorrect: GlobalSinManager.correct_option()
	
	GlobalSinManager.end_interaction(DialogueIndex)
