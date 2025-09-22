extends Node2D

var 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	# Start position
	var width = get_viewport().get_visible_rect().size.x
	var x_position = rng.randi_range(0, width)
	var y_position = rng.randi_range(-150, -50)
	position = Vector2(x_position, y_position)
	
	# Random texture
	var path: String = "res://Assets/Graphics/PNG/Effects/star" + str(rng.randi_range(1,3)) + ".png"
	$Sprite.texture = load(path)
	
	# Random speed/rotation/direction
	speed = rng.randi_range(200,400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
