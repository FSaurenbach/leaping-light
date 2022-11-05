extends Area2D

func _on_Clearer_tree_entered():
	for bodies in get_overlapping_bodies():
		if bodies.is_in_group("obstacle"):
			bodies.queue_free()


func _on_Clearer_body_entered(body):
	pass # Replace with function body.
