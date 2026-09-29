extends Area2D


@onready var panel: Panel = $Panel


func _ready() -> void:
	panel.visible = false


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(5)
		panel.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		_set_outline_thickness(0)
		panel.visible = false

func _set_outline_thickness(thickness: float) -> void:
	var outline_material: ShaderMaterial = $CanvasGroup.material
	outline_material.set_shader_parameter("line_thickness", thickness)
