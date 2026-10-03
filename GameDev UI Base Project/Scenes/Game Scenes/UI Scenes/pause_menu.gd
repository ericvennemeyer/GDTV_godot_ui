extends CanvasLayer


@onready var control: Control = $Control


func _ready() -> void:
	visible = false
	%ResumeButton.grab_focus()
	
	control.offset_transform_enabled = true


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause_game()
		else:
			pause_game()


func pause_game() -> void:
	%ResumeButton.grab_focus()
	get_tree().paused = true
	visible = true
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel()
	
	tween.tween_property(control, "modulate:a", 1.0, 0.25).from(0)
	tween.tween_property(control, "offset_transform_position:y", 0, 0.25).from(50)


func unpause_game() -> void:
	get_tree().paused = false
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel()
	
	tween.tween_property(control, "modulate:a", 0, 0.25)
	await tween.tween_property(control, "offset_transform_position:y", 50, 0.25).finished
	
	if !get_tree().paused:
		visible = false


func _on_quit_button_pressed() -> void:
	get_tree().quit()
