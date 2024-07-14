extends Node2D

func _ready():
	%Time.text = "Time: " + Globals.get_time()

func _on_retry_button_pressed():
	Globals.reset()


func _on_change_name_button_pressed():
	get_tree().change_scene_to_file("res://change_name.tscn")
