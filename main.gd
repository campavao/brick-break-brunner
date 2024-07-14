extends Node2D

func _process(_delta):
	%Time.text = Globals.get_time()

func _on_finish_body_entered(body):
	if body is Player:
		Globals.game_state = Globals.GameState.OVER
		Globals.save_score()
		%Leaderboard.display()


func _on_barrier_body_entered(body):
	if body is Player:
		Globals.game_state = Globals.GameState.OVER
		get_tree().change_scene_to_file("res://try_again.tscn")

