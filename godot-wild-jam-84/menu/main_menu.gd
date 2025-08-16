extends Control
@onready var level = $"../Level"
@onready var main_menu = $"."


func _on_start_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	main_menu.visible = false
	level.visible = true

func _on_option_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
