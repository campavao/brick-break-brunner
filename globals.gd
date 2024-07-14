extends Node

enum GameState {
	IDLE,
	RUNNING,
	OVER
}

var game_state := GameState.IDLE 

var player_name: String
var time_elapsed := 0.0

func _process(delta):
	if Globals.game_state == Globals.GameState.RUNNING:
		time_elapsed += delta


func save_score():
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(player_name, time_elapsed).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))

func start():
	game_state = GameState.RUNNING
	get_tree().change_scene_to_file("res://main.tscn")

func reset():
	time_elapsed = 0.0
	start()
	
func get_time() -> String:
	return str(time_elapsed).pad_decimals(2) + "s"
