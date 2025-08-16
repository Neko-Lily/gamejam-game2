extends BaseGun
var base_gun = preload("res://weapons/guns/base-gun/script/base_gun.gd")
var instance_base_gun = base_gun.new()

@onready var new_hit_box: CollisionShape2D = $enemy_detection/hit_box
@onready var new_shoot_point: Marker2D = %"shoot-point"
@export var pistol_attack_range = 500
@export var detection: Area2D
@onready var pivot: Marker2D = %"pivot"

@onready var attack_timer: Timer = $Timer
var time_until_attack: float = 0.4


func _ready():
	instance_base_gun.set("hit_box", new_hit_box)
	instance_base_gun.set("shoot_point", new_shoot_point)
	attack_timer.set_wait_time(time_until_attack)
	instance_base_gun.change_attack_range(pistol_attack_range)
	detection.set_collision_mask_value(3, true)
	#detection.set_collision_layer_value(3, true)
	
func _physics_process(delta: float) -> void:
	var targets = detection.get_overlapping_bodies()
	if targets.size() > 0:
		print(targets.size())
		self.global_rotation = self.global_position.direction_to(targets[0].global_position).angle()


func _on_timer_timeout() -> void:
	instance_base_gun.shoot()
