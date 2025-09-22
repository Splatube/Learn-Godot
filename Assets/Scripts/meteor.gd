extends Area2D

var rng := RandomNumberGenerator.new()
var random_speed: int

func _ready():
	var width = get_viewport().get_visible_rect().size.x
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	var random_rot = rng.randi_range(0,360)
	rotation = random_rot
	random_speed = rng.randi_range(200,600)
	var dir := DirAccess.open("res://Assets/Graphics/PNG/Meteors/")
	dir.list_dir_begin()
	var random_index = rng.randi_range(0,dir.get_files().size()-1)
	var random_texture = load("res://Assets/Graphics/PNG/Meteors/"+dir.get_files()[random_index].replace(".import", ""))
	$Sprite.texture = random_texture

func _process(delta: float) -> void:
	position += Vector2(0,1) * random_speed * delta

func _on_body_entered(body: Node2D) -> void:
	print(body.name + " has collided")
