extends CharacterBody2D

@export var speed = 200

var direction = Vector2(-1, -1)

func _ready():
	randomize()
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if !collision:
		return
		
	velocity = velocity.bounce(collision.get_normal())
	
	var tilemap = collision.get_collider()
	if tilemap is TileMap:
		var hit = collision.get_position() - collision.get_normal() * safe_margin
		var tile_position = tilemap.local_to_map(hit)
		tilemap.erase_cell(0, tile_position)

