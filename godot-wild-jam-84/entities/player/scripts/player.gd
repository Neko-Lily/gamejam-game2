extends CharacterBody2D

@export var speed = 300.0 
@onready var sprite = $AnimatedSprite2D
var health:int = 100

func _physics_process(delta: float) -> void:

	_player_move(InputEvent)
	
func _process(_delta: float) -> void:
	move_and_slide()


func _player_move(_InputEvent):
	
	var inputVector:Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = inputVector * speed
	if velocity.x != 0 || velocity.y != 0 :
		sprite.play("moving") 
		if velocity.x < 0 :
			sprite.flip_h =true
		if velocity.x > 0 :
			sprite.flip_h= false
	else:
		sprite.play("default")
