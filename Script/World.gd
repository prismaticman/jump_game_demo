extends Node2D

func _ready():
	#用于检测地图的边界
	var tile_map = $TileMap
	var camera_2d = $Node2D/Camera2D
	var rect = tile_map.get_used_rect()
	camera_2d.limit_bottom = rect.end.y * tile_map.cell_size.y
	camera_2d.limit_left = rect.position.x * tile_map.cell_size.x
	camera_2d.limit_right = rect.end.x * tile_map.cell_size.x
	#实例化金币界面
	add_child(preload("res://Scene/HUD.tscn").instance())
	#读取数据
