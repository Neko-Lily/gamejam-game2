extends CharacterBody2D

@export var speed = 300.0 


func _physics_process(delta: float) -> void:

	_player_move(InputEvent)
	
func _process(_delta: float) -> void:
	move_and_slide()


func _player_move(_InputEvent):
	
	var inputVector:Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = inputVector * speed
