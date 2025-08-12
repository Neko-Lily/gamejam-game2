extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Player")

func _process(delta: float) -> void:
	pass

func _move_towards_player():
	var player_position:Vector2 = Vector2(player.global_position.x, player.global_position.y)
