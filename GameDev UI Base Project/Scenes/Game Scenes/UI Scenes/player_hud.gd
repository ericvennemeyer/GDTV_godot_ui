extends CanvasLayer


func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	player.coin_collected.connect(_on_coin_collected)
	
	%CoinCounterLabel.text = str(player.coins)


func _on_coin_collected(current_coins: int) -> void:
	%CoinCounterLabel.text = str(current_coins)
