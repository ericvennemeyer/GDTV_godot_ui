extends CanvasLayer


func _ready() -> void:
	visible = false
	%ResumeButton.grab_focus()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause_game()
		else:
			pause_game()


func pause_game() -> void:
	visible = true
	get_tree().paused = true


func unpause_game() -> void:
	visible = false
	get_tree().paused = false


func _on_quit_button_pressed() -> void:
	get_tree().quit()
