extends HBoxContainer

@export var IsMonologue: bool = false
@export var DialogueIndex: int = 0

@export_subgroup("Nodes")
@export var ModifierNode: 		Control
@export var TextNode: 			Control
@export var ModifierValueNode: 	Control


func assign_monologue(text: String) -> void:
	TextNode.text = text

func assign_dialogue(mod: Array, text: String, mod_value: Array) -> void:
	for i in len(mod):
		ModifierNode.text += "[" + mod[i] + "] "
	TextNode.text = text
	for i in len(mod_value):
		ModifierValueNode.text += str(mod_value[i]) + " " + mod[i] + " "
