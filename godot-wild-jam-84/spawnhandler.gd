extends Node2D
var spawn_count: int
@export var slime_enemy:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while spawn_count < 100:
		var slime_instance = slime_enemy.instantiate()
		slime_instance.global_position.x = randi_range(-1000, 1000)
		slime_instance.global_position.y = randi_range(-1000, 1000)
		add_child(slime_instance)
		spawn_count +=1
