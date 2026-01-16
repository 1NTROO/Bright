class_name LevelManager

extends Node2D

@export_category("Visual Nodes")
@export var LevelShader: ColorRect
@export var LevelModulate: CanvasModulate
@export var InteractShader: ColorRect

var modulateState: bool = true
var shaderState: bool = true

enum LevelState { OFF, SEMI, FULL }

var CurrentState: int = LevelState.FULL

func _ready() -> void:
	GlobalSinManager.ActiveLevel = self

func get_current_state() -> int:
	return CurrentState

func set_current_state(val: int) -> void:
	if (CurrentState != 0): CurrentState = val
	update_level_state()

func update_level_state() -> void:
	match CurrentState:
		0:
			toggle_shader_nodes()
			toggle_modulate_node()
		1:
			toggle_modulate_node()
			toggle_shader_nodes(true)
		2:
			toggle_modulate_node(true)
			toggle_shader_nodes(true)
		_:
			return

func toggle_shader_nodes(setting: bool = false) -> void:
	if LevelShader != null: LevelShader.visible = setting
	if InteractShader != null: InteractShader.visible = setting
	shaderState = setting

func toggle_modulate_node(setting: bool = false) -> void:
	if LevelModulate != null: LevelModulate.visible = setting
	modulateState = setting
