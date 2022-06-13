extends Line2D

onready var preview_line_positions = Array()


func _input(_event):
	if Input.is_action_pressed("light_leap"):
		# Make preview line
		var position1 = get_node("../../CameraPivot/Camera").unproject_position(get_node("..").global_transform.origin)
		position1 = get_node("Node2D").to_local(position1)
		position1 = Vector2(position1.x - 0.5, position1.y)
		var position2 = get_local_mouse_position()
		position2 = Vector2(position2.x + 1, position2.y + 1)
		
		preview_line_positions.clear()
		preview_line_positions.append(position1)
		preview_line_positions.append(position2)
		
		get_node(".").points = Array()
		for p in preview_line_positions:
			get_node(".").add_point(p)
		
	if Input.is_action_just_released("light_leap"):
		# Clear preview line
		preview_line_positions.clear()
		get_node(".").points = Array()
		for p in preview_line_positions:
			get_node(".").add_point(p)
