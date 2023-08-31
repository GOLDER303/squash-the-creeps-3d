extends Node

@export var mob_scene: PackedScene = preload("res://mob.tscn")


func _ready():
	randomize()


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	add_child(mob)

	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.transform.origin

	mob.initialize(mob_spawn_location.position, player_position)
