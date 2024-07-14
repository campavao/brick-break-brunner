extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	fetch_scores()

func fetch_scores():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	var scores = sw_result.scores

	for child in %Entries.get_children():
		%Entries.remove_child(child)
		child.queue_free() 
	
	if scores.size() > 0:
		scores.reverse()
	
	for index in scores.size():
		var score = scores[index]
		var label = Label.new()
		label.text = str(index + 1) + ". " + score.player_name + " - " + str(score.score).pad_decimals(2)
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		%Entries.add_child(label)

func display():
	fetch_scores()
	show()
