extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 5
const MAX_SPEED = 150
const ACCELERATION = 50
const JUMP_HEIGHT = -200
const RUN_SPEED_THRESHOLD = 0
const IDLE_THRESHOLD = 10
var velocity = Vector2(0,0)

#var bullet_scene = preload("res://bullet.tscn")
#func fire():
	

#	var bullet = bullet_scene.instance()
#	bullet.direction = $Position2D.global_position - global_position
#	get_tree().get_root().add_child(bullet)

#func _ready():
#	pass

puppet var puppet_position = Vector2()

func _physics_process(delta):
	if is_network_master():
	
		velocity.y += GRAVITY
		var friction = false
			
		if Input.is_action_pressed("ui_right"):
			velocity.x = min(velocity.x + ACCELERATION, MAX_SPEED)
			$Sprite.flip_h = false
			if Input.is_action_pressed("rightrun") and velocity.x >= RUN_SPEED_THRESHOLD:
				$AnimationPlayer.play("run")
				velocity.x += 100
			else:
				$AnimationPlayer.play("walk")
		elif Input.is_action_pressed("ui_left"):
			velocity.x = max(velocity.x - ACCELERATION, -MAX_SPEED)
			$Sprite.flip_h = true
			if Input.is_action_pressed("leftrun") and abs(velocity.x) >= RUN_SPEED_THRESHOLD:
				$AnimationPlayer.play("run")
				velocity.x -= 100
			else:
				$AnimationPlayer.play("walk")
			
		else:
			friction = true
			$AnimationPlayer.play("idle")
				
				
		if is_on_floor():
			#print("floor gang")
			if Input.is_action_just_pressed("ui_up"):
				velocity.y = JUMP_HEIGHT
			if friction == true:
				velocity.x = lerp(velocity.x,0,0.2)
		else:
			$AnimationPlayer.play("land");
			if friction == true:
				velocity.x = lerp(velocity.x,0,0.05)
		
		velocity = move_and_slide(velocity, UP)
		rset("puppet_position", position)
	else:
		position = puppet_position
	
