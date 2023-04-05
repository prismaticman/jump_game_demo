extends Control
#预加载
onready var button_2 = $VBoxContainer/Button2
onready var title_animation = $Title_animation
onready var parallax_background = $ParallaxBackground
#
export var scroll_velocity = 55

func _process(delta):
	parallax_background.scroll_offset.x += scroll_velocity*delta
	
#设置按钮
func _on_Button2_pressed():
	title_animation.play("button_in")
	pass # Replace with function body.
	
#返回按钮
func _on_Button3_pressed():
	title_animation.play_backwards("button_in")
	pass # Replace with function body.
