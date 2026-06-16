extends Node2D

func _ready() -> void:
	levelsetup() 
func _process(delta: float) -> void:
	pass

func levelsetup() -> void:
	var enemies = $level_root.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_onplayerDied)
			
			
#signal handling
func _onplayerDied(body):
	print(body)
	print("player ded")
