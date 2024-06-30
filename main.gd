extends Node2D

var time_elapsed := 0.0

enum GameState {
	IDLE,
	RUNNING,
	OVER
}

var game_state := GameState.IDLE 

var player_name := "Default"

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
	
	if player_name != "Default":
		%PlayerNameInput.text = player_name

func _process(delta):
	if game_state == GameState.RUNNING:
		time_elapsed += delta
		
	%Time.text = str(time_elapsed).pad_decimals(2) + "s"

func _on_finish_body_entered(body):
	game_state = GameState.OVER
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(player_name, time_elapsed).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))

func _on_start_button_pressed():
	game_state = GameState.RUNNING
	%StartButton.hide()
	%PlayerNameInput.hide()
	toggle_children_process(self, true)
		
		
func toggle_children_process(node: Node2D, value: bool):
	for child in node.get_children():
		child.set_process(value)
		child.set_physics_process(value)
		
		if child is Node2D:
			toggle_children_process(child, value)
		


func _on_barrier_body_entered(body):
	get_tree().reload_current_scene()
	time_elapsed = 0.0

func _on_player_name_input_text_changed(new_text: String):
	player_name = new_text	
	%StartButton.disabled = new_text.length() < 3
