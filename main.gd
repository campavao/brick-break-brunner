extends Node2D

func _process(_delta):
	%Time.text = str(Globals.time_elapsed).pad_decimals(2) + "s"

func _on_finish_body_entered(body):
	Globals.game_state = Globals.GameState.OVER
	Globals.get_scores()
	%Leaderboard.display()


func _on_barrier_body_entered(body):
	get_tree().reload_current_scene()
	Globals.reset()

