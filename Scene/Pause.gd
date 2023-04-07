extends Control


func show_menu():
	$AnimationPlayer.play("Pause_on")
	show()
	
func hide_menu():
	$AnimationPlayer.play_backwards("Pause_on")
	hide()



func _on_Continue_pressed():
	hide_menu()
	pass # Replace with function body.
	



func _on_Quit2_pressed():
	hide_menu()
	Globals.go_to_world("res://Scene/Title.tscn")
	pass # Replace with function body.
	



func _on_Pause_visibility_changed():
	get_tree().paused = visible
	pass # Replace with function body.
