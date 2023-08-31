extends Node

@export var mob_scene: PackedScene = preload("res://mob.tscn")


func _ready():
	randomize()


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.transform.origin

	mob.position.x = 25
	mob.position.z = 25

	add_child(mob)
	mob.initialize(mob_spawn_location.position, player_position)


func _on_player_hit():
	$MobTimer.stop()
