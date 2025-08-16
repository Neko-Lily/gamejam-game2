extends Area2D
class_name bullet

var bullet_speed = 1000
var travelled_distance = 0

func _physics_process(delta: float) -> void:
	const MAX_RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * bullet_speed * delta
	
	travelled_distance += bullet_speed * delta
	if travelled_distance > MAX_RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
