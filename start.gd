extends Node2D

func _ready():
	toggle_children_process(self, false)
	
	SilentWolf.configure({
		"api_key": "YGC0ZKnFHU9t3uZ1vuclw31Bve55hJ1X796P8ZhW",
		"game_id": "BrickBreakBrunner",
		"log_level": 1
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})

func _input(event):
	if event is InputEventKey:
		toggle_children_process(self, true)


func _on_barrier_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_file("res://change_name.tscn")

func toggle_children_process(node: Node2D, value: bool):
	for child in node.get_children():
		child.set_process(value)
		child.set_physics_process(value)
		
		if child is Node2D:
			toggle_children_process(child, value)

