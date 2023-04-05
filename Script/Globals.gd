extends Node2D

onready var animation_player = $AnimationPlayer

func go_to_world(path):
	animation_player.play_backwards("fade_in")
	yield(animation_player,"animation_finished")
	get_tree().change_scene(path)
	animation_player.play("fade_in")
	
	pass
