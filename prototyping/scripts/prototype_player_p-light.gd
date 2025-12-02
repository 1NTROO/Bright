extends PointLight2D


func _on_radius_slider_value_changed(value: float) -> void:
	texture_scale = value


func _on_intensity_slider_value_changed(value: float) -> void:
	energy = value
