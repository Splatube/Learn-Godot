extends CanvasLayer

static var image = load("res://Assets/Graphics/PNG/UI/playerLife1_red.png")

func set_health(amount):
	for child in $"Bottom Left/Lives".get_children():
		child.queue_free()
		
	for i in amount:
		var life = TextureRect.new()
		life.stretch_mode = TextureRect.STRETCH_KEEP
		life.name = "Life"+str(i)
		life.texture = image
		$"Bottom Left/Lives".add_child(life)
