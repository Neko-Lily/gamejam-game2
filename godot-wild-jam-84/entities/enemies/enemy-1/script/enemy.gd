extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Player")
@export var SPEED = 300
@export var max_distance_to_player = 80


func _process(delta: float) -> void:
	_move_towards_player(delta)

func _move_towards_player(delta: float):
	var player_position:Vector2 = Vector2(player.global_position.x, player.global_position.y)
	velocity = global_position.direction_to(player_position) * SPEED
	
	if global_position.distance_to(player_position) > max_distance_to_player:
		move_and_slide()
	else:
		global_position.move_toward(Vector2(0,0),delta)
