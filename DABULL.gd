extends Area2D
var direction = Vector2. RIGHT
var speed = 400

func _process(delta):

	translate(direction.normalized()* speed * delta)


func _on_DABULL_body_entered(body):
	queue_free() # Replace with function body.
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.
