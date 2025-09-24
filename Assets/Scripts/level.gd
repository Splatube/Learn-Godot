extends Node2D

var meteorScene: PackedScene = load("res://Scenes/meteor.tscn")
var laserScene: PackedScene = load("res://Scenes/laser.tscn")

var health := 3
var score := 0

func _ready() -> void:
	get_tree().call_group('ui', 'set_health', health)

func _on_player_laser(pos) -> void:
	var laser = laserScene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	laser.name = "Laser"

func _on_meteor_timer_timeout() -> void:
	var meteor = meteorScene.instantiate()
	$Meteors.add_child(meteor)
	if $MeteorTimer.wait_time > 0.25:
		$MeteorTimer.wait_time -= 0.005
	meteor.name = "Meteor"
	meteor.connect('collision', _on_meteor_collision)


func _on_meteor_collision(body):
	if body.name == "Player":
		health -= 1
		get_tree().call_group('ui', 'set_health', health)
		if health <= 0:
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
