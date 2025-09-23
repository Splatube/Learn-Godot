extends Node2D

var meteorScene: PackedScene = load("res://Scenes/meteor.tscn")
var laserScene: PackedScene = load("res://Scenes/laser.tscn")

func _on_player_laser(pos) -> void:
	var laser = laserScene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos


func _on_meteor_timer_timeout() -> void:
	var meteor = meteorScene.instantiate()
	$Meteors.add_child(meteor)
	if $MeteorTimer.wait_time > 0.25:
		$MeteorTimer.wait_time -= 0.005
