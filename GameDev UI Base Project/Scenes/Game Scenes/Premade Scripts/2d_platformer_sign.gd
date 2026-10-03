extends Area2D


@onready var panel: Panel = $Panel


func _ready() -> void:
	#panel.visible = false
	panel.offset_transform_enabled = true
	panel.offset_transform_scale = Vector2.ZERO


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(5)
		#panel.visible = true
		
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_SPRING)
		tween.set_ease(Tween.EASE_OUT)
		tween.set_parallel()
		
		tween.tween_property(panel, "offset_transform_scale", Vector2(1.0, 1.0), 0.25)
		tween.tween_property(panel, "offset_transform_rotation", 0, 0.25).from(-10.0)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(0)
		
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.set_parallel()
		
		tween.tween_property(panel, "offset_transform_scale", Vector2.ZERO, 0.2)
		tween.tween_property(panel, "offset_transform_rotation", 10, 0.25)
		
		#panel.visible = false


func _set_outline_thickness(thickness: float) -> void:
	var outline_material: ShaderMaterial = $CanvasGroup.material
	outline_material.set_shader_parameter("line_thickness", thickness)
