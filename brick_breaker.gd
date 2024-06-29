extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Paddle.global_position.x = $Ball.global_position.x
