extends Node2D
var Canparry = true
var bullet_scene = preload("res://DABULL.tscn")

func fire():
	var bullet = bullet_scene.instance()
	bullet.direction = $Position2D.global_position - global_position
	bullet.global_position = $Position2D.global_position
	get_tree().get_root().add_child(bullet)

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("parry") and Canparry:
		fire()
