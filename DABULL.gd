extends Area2D
var direction = Vector2. RIGHT
var speed = 400

puppet var puppet_position = Vector2()

func _process(delta):
	if is_network_master():
		translate(direction.normalized()* speed * delta)
		rset("puppet_position", position)
	else:
		position = puppet_position


func _on_DABULL_body_entered(body):
	queue_free() # Replace with function body.
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.
