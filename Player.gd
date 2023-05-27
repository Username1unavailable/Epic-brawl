extends RigidBody2D

puppet var puppet_position = Vector2()

func _physics_process(delta):
	if is_network_master():
		rset("puppet_position", position)
	else:
		position = puppet_position

func _on_PhysicsChain_Angle(angle) -> void:
	$Label.text = "Angle: " + String(angle)
