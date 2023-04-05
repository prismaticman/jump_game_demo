extends Area2D



func _on_Area2D_body_entered(_body):
	#金币加一
	Globals.coins_collect += 1
	$AnimationPlayer.play("eat")	
	pass # Replace with function body.
