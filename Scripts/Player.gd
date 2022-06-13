extends KinematicBody2D

var clicked = false
var invincible = false



func _input(_event):
	if Input.is_action_just_released("light_leap"):
		clicked = true


func _physics_process(delta):
	if clicked:
		# Save new position
		var new_pos = get_viewport().get_mouse_position()
		
		# Accessing space in order to make raycast query from old to new position
		var space_state = get_world_2d().direct_space_state
		var ray = space_state.intersect_ray(global_position, new_pos, [self])
		
		# Check if ray hits anything
		if ray:
			# Give player invincibility tag when coin is collected
			if "PowerUp" in str(ray.collider):
				print("Ba-ding!")
				invincible = true
			# Check for invincibility when hit by obstacle
			if "Obstacle" in str(ray.collider):
				if !invincible: 
					print("Game over!")
					clicked = false
					get_tree().quit()
				else:
					print("Lost invincibility")
					invincible = false


		# Move Player to clicked position
		transform.origin = new_pos
		clicked = false
