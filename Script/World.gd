extends Node2D



#
#func _on_Music_pressed():
#	var music_id = 2
#	AudioServer.set_bus_mute(music_id,!AudioServer.is_bus_mute(music_id))
#
#	pass # Replace with function body.


func _on_Sfx_pressed():
	var music_id = 2
	AudioServer.set_bus_mute(music_id,!AudioServer.is_bus_mute(music_id))

	pass # Replace with function body.


func _on_Music_pressed():
	var music_id = 1
	AudioServer.set_bus_mute(music_id,!AudioServer.is_bus_mute(music_id))
	
	pass # Replace with function body.
