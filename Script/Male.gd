extends KinematicBody2D
#重力
const gravity = 2300
#最大速度
const max_speed = 678
#在地面的摩擦力
const acceleration = max_speed/0.22
#角色在空中的摩檫力
const air_acceleration = max_speed/0.06
#跳越的高度
const jump_force = 820
#角色的向量
var velocity = Vector2.ZERO
#角色是否在跳越
var is_on_jumping = false

onready var AnimatedSprite = $AnimatedSprite
onready var coyot_time = $Timer
onready var jump_request_time = $Timer2


#物理帧，处理移动
func _physics_process(_delta):
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity,Vector2.UP)
	if is_on_floor():
		is_on_jumping = false
	#没在地面并没有按下跳越键触发郊狼时间
	elif was_on_floor and not is_on_jumping:
		coyot_time.start()

		
#输入函数		
func _input(_event):
	
	var can_jump = is_on_floor() or coyot_time.time_left>0
	if Input.is_action_just_pressed("jump"):
		jump_request_time.start()
	if Input.is_action_pressed("jump") and can_jump:
		velocity.y = -jump_force
		is_on_jumping = true
		jump_request_time.stop()
		coyot_time.stop()
		$AudioStreamPlayer.play(0)
	#释放按键的时间决定跳越的高度
	if Input.is_action_just_released("jump") and velocity.y < -jump_force/1.7:
		velocity.y = -jump_force/1.7


func _process(delta):
	#角色的移动向量
	var direction = Input.get_action_strength("move_left")-Input.get_action_strength("move_righ")
	#空中与地面的摩檫力差别
	var acc = air_acceleration if is_on_floor() else acceleration
	#使角色有摩檫力
	velocity.x = move_toward(velocity.x,-direction*max_speed,acc*delta)
	velocity.y += gravity*delta
	#动画播放
	if is_on_jumping:
		AnimatedSprite.play("jump")
	elif velocity.x==0:
		AnimatedSprite.play("idle")
	else:
		AnimatedSprite.play("walk")
	#水平翻转	
	if direction !=0 :	
		AnimatedSprite.flip_h  = direction>0
