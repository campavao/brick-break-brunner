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


func get_scores():
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(player_name, time_elapsed).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))

func start():
	game_state = GameState.RUNNING

func reset():
	time_elapsed = 0.0
