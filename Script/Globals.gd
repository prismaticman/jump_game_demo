extends Node2D
#创建信号
signal coins_change

#总线变量
const BGM_ID = 1
const SFX_ID = 2
#游戏存档目录
const CONFIG_PATH = "user://setting.cfg"

var Bgm_enable = true
var Sfx_enable = true
#当数值变化时调用set_coin函数
var coins_collect:int = 999 setget set_coin


onready var animation_player = $AnimationPlayer


func _ready():
	load_config()


#切换世界动画
func go_to_world(path):
	animation_player.play_backwards("fade_in")
	yield(animation_player,"animation_finished")
	get_tree().change_scene(path)
	animation_player.play("fade_in")
	yield(animation_player,"animation_finished")
	pass
	
#获取金币的数量	
func get_coin():
	return coins_collect

	
func set_coin(value):
	coins_collect = value
	emit_signal("coins_change")
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
#保存游戏数据
func save_config():
	var file = ConfigFile.new()
	file.set_value("audio","Bgm_enable",is_bgm_enabled())
	file.set_value("audio","Sfx_enable",is_sfx_enabled())
	var err = file.save(CONFIG_PATH)
	if err != OK:
		push_error("Failed to save config: %d"%err)
#读取游戏数据		
func load_config():
	var file = ConfigFile.new()
	var err = file.load(CONFIG_PATH)
	if err == OK:
		print(file.get_value("audio","Sfx_enable"))
		AudioServer.set_bus_mute(SFX_ID,!file.get_value("audio","Sfx_enable"))
		print(file.get_value("audio","Bgm_enable"))
		AudioServer.set_bus_mute(BGM_ID,!file.get_value("audio","Bgm_enable"))	
	else:
		push_warning("Failed to load config: %d"%err)
		AudioServer.set_bus_mute(SFX_ID,true)
		AudioServer.set_bus_mute(BGM_ID,true)
