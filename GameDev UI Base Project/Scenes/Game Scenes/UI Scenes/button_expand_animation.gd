extends Button


func _ready() -> void:
	offset_transform_enabled = true
	offset_transform_visual_only = false
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "offset_transform_scale", Vector2(1.2, 1.2), 0.2)


func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_SPRING)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "offset_transform_scale", Vector2(1.0, 1.0), 0.2)
