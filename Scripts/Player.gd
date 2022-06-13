extends KinematicBody2D

var clicked = false
var invincible = false
onready var Player = get_parent().get_node("Player")
var speed = 5
var is_in_middle_row = false
var is_in_right_row = false
var is_in_left_row = false
func _ready():
	pass

func _input(_event):
	if Input.is_action_just_released("light_leap"):
		clicked = true
	if Input.is_action_just_pressed("d"):
		if (is_in_right_row == false):
			Player.position.x +=150
			
		
	if Input.is_action_just_pressed("a"):
		if (is_in_left_row == false):
			Player.position.x -=150


func _physics_process(delta):
	
	get_parent().get_node("SlidingBackground").position.y += speed
	get_parent().get_node("ParalaxBackground").position.y += speed*0.4
	
		
	
	
	if clicked:
		return
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
					return
				else:
					print("Lost invincibility")
					invincible = false


		# Move Player to clicked position
		transform.origin = new_pos
		clicked = false


func _on_RowLeft_body_entered(body):
	if body.is_in_group("Player"):
		is_in_left_row = true
		is_in_right_row = false
		is_in_middle_row = false
		print("Body in left row")
		var row = get_parent().get_node("RowLeft")
		var newPos = row.position.x
		body.position.x = newPos


func _on_RowRight_body_entered(body):
	if body.is_in_group("Player"):
		is_in_left_row = false
		is_in_right_row = true
		is_in_middle_row = false
		print("Body in right row")
		var row = get_parent().get_node("RowRight")
		var newPos = row.position.x
		body.position.x = newPos


func _on_RowMiddle_body_entered(body):
	if body.is_in_group("Player"):
		is_in_left_row = false
		is_in_right_row = false
		is_in_middle_row = true
		print("Body in middle row")
		var row = get_parent().get_node("RowMiddle")
		var newPos = row.position.x
		body.position.x = newPos
		
