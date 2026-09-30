extends CanvasLayer


func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	player.hp_changed.connect(_on_hp_changed)
	player.coin_collected.connect(_on_coin_collected)
	
	%PlayerHPBar.value = player.hp
	%CoinCounterLabel.text = str(player.coins)


func _on_coin_collected(current_coins: int) -> void:
	%CoinCounterLabel.text = str(current_coins)


func _on_hp_changed(current_hp: int) -> void:
	%PlayerHPBar.value = current_hp
