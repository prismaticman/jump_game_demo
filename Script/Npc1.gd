extends Area2D

onready var sprite = $Sprite

var dialogs = [
	{avatar = "Npc1",text = "你好呀我的朋友"},
	{avatar = "Npc2",text = "青，取之于蓝，而青于蓝;冰，水为之，而寒于水。木直中绳，鞣以为轮，其曲中规。虽有槁暴，不复挺者，鞣使之然也。"},
	{avatar = "Npc1",text = "故木受绳则直，金就砺则利，君子博学而日参省乎己，则知明而行无过矣。"},
	{avatar = "Npc2",text = "吾尝终日而思矣，不如须臾之所学也;吾尝跂而望矣，不如登高之博见也。登高而招，臂非加长也，而见者远;顺风而呼，声非加疾也，而闻者彰。"},
	{avatar = "Npc1",text = "假舆马者，非利足也，而致千里;假舟相者，非能水也，而绝江河。君子生非异也，善假于物也。"},
	{avatar = "Npc2",text = "积土成山，风雨兴焉;积水成渊，蛟龙生焉;积善成德，而神明自得，圣心备焉。故不积跬步，无以至千里;不积小流，无以成江海。"},
]

func _unhandled_input(event):
	if sprite.visible and event.is_action_pressed("interact"):
		
		$CanvasLayer.show_dialog_box(dialogs)
		
	
	
func _on_Area2D_area_entered(_area):
	sprite.show()
	pass # Replace with function body.


func _on_Area2D_area_exited(_area):
	sprite.hide()
	pass # Replace with function body.
