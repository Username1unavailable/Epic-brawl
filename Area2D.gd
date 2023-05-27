extends Area2D
var direction = Vector2. RIGHT
var speed = 400

func _process(delta):

	translate(direction.normalized()* speed * delta)
	$AnimationPlayer.play("roll")
func _on_bullet_body_entered(body):
	queue_free() # Replace with function body.
	yield(get_tree().create_timer(1.0), "timeout")
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()# Replace with function body.
