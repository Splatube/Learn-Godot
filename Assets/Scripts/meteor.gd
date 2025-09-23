extends Area2D

var speed: int
var x_direction: float
var rotation_speed: float

func _ready():
	var rng := RandomNumberGenerator.new()
	
	# Start position
	var width = get_viewport().get_visible_rect().size.x
	var x_position = rng.randi_range(0, width)
	var y_position = rng.randi_range(-150, -50)
	position = Vector2(x_position, y_position)
	
	# Random texture
	var path: String = "res://Assets/Graphics/PNG/Meteors/" + str(rng.randi_range(1,6)) + ".png"
	$Sprite.texture = load(path)
	
	# Random speed/rotation/direction
	speed = rng.randi_range(200,400)
	x_direction = rng.randf_range(-1,1)
	rotation_speed = rng.randf_range(10,100)

func _process(delta: float) -> void:
	# Velocity
	position += Vector2(x_direction, 1) * speed * delta
	
	# Rotation
	rotation_degrees += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	pass

func _on_body_exited(body: Node2D) -> void:
	if body.find_parent("Border") and body.name != "Top":
		queue_free()
