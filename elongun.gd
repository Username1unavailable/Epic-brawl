extends Node2D

const GRAVITY = 20
const MAX_SPEED = 150
const ACCELERATION = 50
const JUMP_HEIGHT = -200
const RUN_SPEED_THRESHOLD = 0
const IDLE_THRESHOLD = 10
var velocity = Vector2(0,0)

var Canparry = true
var bullet_scene = preload("res://DABULL.tscn")


func fire():
	var bullet = bullet_scene.instance()
	bullet.direction = $Position2D.global_position - global_position
	bullet.global_position = $Position2D.global_position
	get_tree().get_root().add_child(bullet)

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("ui_right"):
			velocity.x = min(velocity.x + ACCELERATION, MAX_SPEED)
			$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
				velocity.x = max(velocity.x - ACCELERATION, -MAX_SPEED)
				$Sprite.flip_h = true
	if Input.is_action_pressed("parry") and Canparry:
		fire()
	
	
