extends Area2D

@export var DialoguePanel: Panel

var isMouseOver: bool = false

@export_subgroup("Dialogue Options")
@export var Monologue: Array[String]
@export var DialogueText: Array[String]
@export var DialogueModifiers: Dictionary
@export var DialogueModifierValues: Dictionary

class DialogueOption:
	var dialogue_text: String
	var dialogue_modifiers: Dictionary
	
	func initialize(text: String, modifiers: Array, mod_values: Array) -> void:
		dialogue_text = text
		for i in len(modifiers):
			if (mod_values[i] == null): return
			dialogue_modifiers[modifiers[i]] = mod_values 
	
var DialogueOptionList: Array[DialogueOption]

func _ready() -> void:
	for i in len(DialogueText):
		var d = DialogueOption.new()
		d.initialize(DialogueText[i], DialogueModifiers[i], DialogueModifierValues[i])
		DialogueOptionList.append(d)
		
	dialogue_setup()

func _mouse_enter() -> void:
	isMouseOver = true
	
func _mouse_exit() -> void:
	isMouseOver = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and isMouseOver:
		if (DialoguePanel == null): return
		dialogue_visibility()
		GlobalSinManager.ActiveInteractible = self

func dialogue_setup() -> void:
	var monologue_box = DialoguePanel.find_child("MonologueBox")
	monologue_box.assign_monologue(Monologue[0])
	
	var dialogue_boxes = DialoguePanel.find_children("DialogueBox")
	for i in len(DialogueOptionList):
		if (dialogue_boxes[i].DialogueIndex != i): continue
		var dialogue_text = DialogueOptionList[i].dialogue_text
		dialogue_boxes[i].assign_dialogue(dialogue_text)

func dialogue_visibility(enable: bool = true) -> void:
	if (DialoguePanel == null): return
	dialogue_setup()
	DialoguePanel.visible = enable
