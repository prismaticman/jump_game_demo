extends Node2D
#总线变量
const BGM_ID = 1
const SFX_ID = 2
var Bgm_enable = true
var Sfx_enable = true


onready var animation_player = $AnimationPlayer

#切换世界动画
func go_to_world(path):
	animation_player.play_backwards("fade_in")
	yield(animation_player,"animation_finished")
	get_tree().change_scene(path)
	animation_player.play("fade_in")
	pass
#读取音乐状态	
func is_bgm_enabled():
	return not AudioServer.is_bus_mute(BGM_ID)
#设置音乐状态	
func set_bgm_enable():
	AudioServer.set_bus_mute(BGM_ID,!AudioServer.is_bus_mute(BGM_ID))
#读取音效状态	
func is_sfx_enabled():
	return not AudioServer.is_bus_mute(SFX_ID)
#设置音效状态	
func set_sfx_enable():
	AudioServer.set_bus_mute(SFX_ID,!AudioServer.is_bus_mute(SFX_ID))
