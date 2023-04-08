extends Control
#预加载
onready var title_animation = $Title_animation
onready var parallax_background = $ParallaxBackground

onready var yes_audio = $Yes_audio
onready var no_audio = $No_audio
onready var go_audio = $Go_audio

onready var music = $VBoxContainer2/Music
onready var sfx = $VBoxContainer2/Sfx


export var scroll_velocity = 55


func _process(delta):
	parallax_background.scroll_offset.x += scroll_velocity*delta

func _ready():
	update_button()
	
#设置按钮
func _on_Button2_pressed():
	yes_audio.play(0)
	title_animation.play("button_in")
	pass # Replace with function body.
	
#返回按钮
func _on_Button3_pressed():
	no_audio.play(0)
	title_animation.play_backwards("button_in")
	pass # Replace with function body.

#开始按钮
func _on_Button_pressed():
	go_audio.play(0)
	yield(go_audio,"finished")
	Globals.go_to_world("res://Scene/World.tscn")
	pass # Replace with function body.

#退出按钮
func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

#音乐开关
func _on_Music_pressed():
	Globals.set_bgm_enable()
	Globals.save_config()
	update_button()
	pass # Replace with function body.

#音效开关
func _on_Sfx_pressed():
	Globals.set_sfx_enable()
	Globals.save_config()
	update_button()
	pass # Replace with function body.

func update_button():
	music.text = "音乐:"+("开" if Globals.is_bgm_enabled() else "关")
	sfx.text = "音效:"+("开" if Globals.is_sfx_enabled() else "关")

