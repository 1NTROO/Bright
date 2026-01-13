extends HBoxContainer

@export var IsMonologue: bool = false
@export var DialogueIndex: int = 0

@export_subgroup("Nodes")
@export var ModifierNode: 		Control
@export var TextNode: 			Control
@export var ModifierValueNode: 	Control


func assign_monologue(text: String) -> void:
	TextNode.text = text

func assign_dialogue(text: String) -> void:
	TextNode.text = text
