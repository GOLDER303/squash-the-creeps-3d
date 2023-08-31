extends Node

@export var mob_scene: PackedScene = preload("res://mob.tscn")


func _ready():
	randomize()


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		get_tree().reload_current_scene()


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.transform.origin

	mob.position.x = 25
	mob.position.z = 25

	add_child(mob)
	mob.initialize(mob_spawn_location.position, player_position)
	mob.connect("squashed", $UserInterface/ScoreLabel._on_mob_squashed)


func _on_player_hit():
	$MobTimer.stop()
	$UserInterface/Retry.show()
