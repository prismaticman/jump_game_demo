extends CanvasLayer

onready var label = $Label
#初始化金币数量
func _ready():
	Globals.connect("coins_change",self,"on_coin_change")
	label.text = str(Globals.get_coin())
	
#数量变化		
func on_coin_change():
	label.text = str(Globals.get_coin())
	$AnimationPlayer.play_backwards("Eat_coin")

func _on_Button_pressed():
	$AnimationPlayer.play("pause")
	yield($AnimationPlayer,"animation_finished")
	$Pause.show_menu()
	pass # Replace with function body.
