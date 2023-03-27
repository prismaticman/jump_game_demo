extends KinematicBody2D
#重力
const gravity = 2300
#速度
const speed = 550
#跳越的高度
const jump_force = 820
#角色的向量
var velocity = Vector2.ZERO
#角色是否在跳越
var is_on_jumping = false


onready var AnimatedSprite = $AnimatedSprite


#物理帧，处理移动
func _physics_process(_delta):
	velocity = move_and_slide(velocity,Vector2.UP)
	if is_on_floor():
		is_on_jumping = false
		
#输入函数		
func _input(_event):
	if Input.is_action_pressed("jump") and not is_on_jumping:
		velocity.y = -jump_force
		is_on_jumping = true



func _process(delta):
	var direction = Input.get_action_strength("move_left")-Input.get_action_strength("move_righ")
	velocity.x = -direction*speed
	velocity.y += gravity*delta
	#动画播放
	if is_on_jumping:
		AnimatedSprite.play("jump")
	elif direction == 0:
		AnimatedSprite.play("idle")
	else:
		AnimatedSprite.play("walk")
	#水平翻转	
	if direction !=0 :	
		AnimatedSprite.flip_h  = direction>0
