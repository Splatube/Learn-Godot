extends Node2D

var meteorScene: PackedScene = load("res://Scenes/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	var meteor = meteorScene.instantiate()
	$Meteors.add_child(meteor)
