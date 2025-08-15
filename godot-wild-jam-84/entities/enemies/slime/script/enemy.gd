extends CharacterBody2D

@onready var target = get_tree().get_first_node_in_group("Player")
@export var SPEED = 60
@export var max_distance_to_target = 60
var max_distance_to_slime = 50
@onready var sprite = $AnimatedSprite2D
@onready var slime = $"."
var health = 3

func _process(delta: float) -> void:
	_move_towards_target(delta)

func _move_towards_target(delta: float):
	var target_position:Vector2 = Vector2(target.global_position.x, target.global_position.y)
	velocity = global_position.direction_to(target_position) * SPEED
	
	
	
	if global_position.distance_to(target_position) > max_distance_to_target:
		move_and_slide()
	else:
		global_position.move_toward(Vector2(0,0),delta)

	if velocity.x != 0 || velocity.y != 0 :
		if velocity.x > 0 :
			sprite.flip_h =true
		if velocity.x < 0 :
			sprite.flip_h= false
	else:
		sprite.play("default")


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass
	
