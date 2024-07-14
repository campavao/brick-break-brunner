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

func _input(_event):
	toggle_children_process(self, true)


func _on_barrier_body_entered(body):
	if body is Player:
		%EnterName.show()
		toggle_children_process(self, false)


func toggle_children_process(node: Node2D, value: bool):
	for child in node.get_children():
		child.set_process(value)
		child.set_physics_process(value)
		
		if child is Node2D:
			toggle_children_process(child, value)


func _on_start_button_pressed():
	Globals.start()
	get_tree().change_scene_to_file("res://main.tscn")

func _on_player_name_input_text_changed(new_text: String):
	Globals.player_name = new_text	
	%StartButton.disabled = new_text.length() < 3
