extends Node2D

func _ready():
	if Globals.player_name:
		%PlayerNameInput.text = Globals.player_name
		%StartButton.disabled = Globals.player_name.length() < 3

func _on_start_button_pressed():
	Globals.reset()

func _on_player_name_input_text_changed(new_text: String):
	Globals.player_name = new_text
	%StartButton.disabled = new_text.length() < 3
