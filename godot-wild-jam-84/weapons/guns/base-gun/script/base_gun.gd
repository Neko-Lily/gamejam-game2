class_name BaseGun
extends Node2D

var attack_range: float:
	set(new_value):
		print('setting')
		attack_range = new_value
	get:
		print('reading')
		return attack_range
var hit_box: CollisionShape2D:
	set(new_value):
		print('setting')
		hit_box = new_value
	get:
		print("get")
		return hit_box
var shoot_point: Marker2D

func _ready() -> void:
	# Example on how to set up attack range for the weapons built with this script
	#
	# set("attack_range", 1000)
	# hit_box.shape.set_radius(get("attack_range"))
	# print(hit_box.shape.radius)
	pass
	
func _physics_process(delta: float) -> void:
	pass
	
func change_attack_range(new_attack_range):
	set("attack_range", new_attack_range)
	hit_box.shape.set_radius(get("attack_range"))
	print(hit_box.shape.radius)
	
func shoot():
	const BULLET = preload("res://weapons/guns/bullet/scene/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = shoot_point.global_position
	new_bullet.global_rotation = shoot_point.global_rotation
	shoot_point.add_child(new_bullet)
