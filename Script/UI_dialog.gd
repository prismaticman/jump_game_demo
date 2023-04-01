extends CanvasLayer

#加载玩家的头像
const AVATAR_MAP = {
	"Npc1":preload("res://Image/UI/avatar (2).png"),
	"Npc2":preload("res://Image/UI/avatar.png")	
}

#字典存储对话的信息
var dialogs = [
#	{avatar = "Npc1",text = "你好呀我的朋友"},
#	{avatar = "Npc2",text = "青，取之于蓝，而青于蓝;冰，水为之，而寒于水。木直中绳，鞣以为轮，其曲中规。虽有槁暴，不复挺者，鞣使之然也。"},
#	{avatar = "Npc1",text = "故木受绳则直，金就砺则利，君子博学而日参省乎己，则知明而行无过矣。"},
#	{avatar = "Npc2",text = "吾尝终日而思矣，不如须臾之所学也;吾尝跂而望矣，不如登高之博见也。登高而招，臂非加长也，而见者远;顺风而呼，声非加疾也，而闻者彰。"},
#	{avatar = "Npc1",text = "假舆马者，非利足也，而致千里;假舟相者，非能水也，而绝江河。君子生非异也，善假于物也。"},
#	{avatar = "Npc2",text = "积土成山，风雨兴焉;积水成渊，蛟龙生焉;积善成德，而神明自得，圣心备焉。故不积跬步，无以至千里;不积小流，无以成江海。"},
]

#记录对话进行到了第几个
var current = 0

#显示字符的间隔
export var interval = 0.1
#切换头像的时间
export var avatar_switching =1

#预加载
onready var texture_rect_2 = $TextureRect2
onready var label = $Label
onready var canvas_layer = $"."
onready var tween = $Tween
onready var animation_player = $TextureRect2/AnimationPlayer

#初始化对话
func _ready():
	hide_dialog_box()
	#show_dialog_box(dialogs)
	
#当按键按下时推进对话	
func _unhandled_input(event):
	get_tree().paused = canvas_layer.visible
	if event.is_action_pressed("ui_accept"):
		if tween.is_active():
			tween.remove_all()
			label.percent_visible = 1
			
		#当对话未结束
		elif current + 1<dialogs.size():
			_show_dialog(current+1)
		else:
			hide_dialog_box()
		
		get_tree().set_input_as_handled()
		

#对话框的隐藏	
func hide_dialog_box():
	canvas_layer.hide()
	
	
#显示对话框	
func show_dialog_box(_dialogs):
	dialogs = _dialogs
	canvas_layer.show()
	_show_dialog(0)


#显示对话	
func _show_dialog(index):
	current = index
	var dialog = dialogs[current]
	label.text = dialog.text
	texture_rect_2.texture = AVATAR_MAP[dialog.avatar]
	animation_player.play("switch")
	#tween插值动画
	#六个参数分别是“对象”，“属性”，“初始值”，“结束值”，“动画时间”，“动画曲线”
	tween.interpolate_property(
		label,"percent_visible",0,1,
		interval*label.text.length(),
		Tween.TRANS_LINEAR
	)
	#开始动画
	tween.start()

