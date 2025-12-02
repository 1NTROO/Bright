extends CanvasModulate


func _on_r_value_changed(value: float) -> void:
	color.r = value / 256

func _on_g_value_changed(value: float) -> void:
	color.g = value / 256

func _on_b_value_changed(value: float) -> void:
	color.b = value / 256

func _on_a_value_changed(value: float) -> void:
	color.a = value / 100
