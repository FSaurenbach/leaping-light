extends KinematicBody2D
var old_pos
var clicked = false
var invincible = false
var vero = false
var old_score = Game.score

func _ready():
	if Game.music == true:
		get_parent().get_node("AudioStreamPlayer").play()
	
	old_pos = position
	if Game.skin == "white":
		$Light.set_texture(Game.light_white)
	if Game.skin == "blue":
		$Light.set_texture(Game.light_blue)
	if Game.skin == "red":
		$Light.set_texture(Game.light_red)
	
	Game.playable = true
	
func _input(_event):
	if Input.is_action_just_released("light_leap") and Game.playable:
		clicked = true
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		Game.save(Game.score)
	

func _process(_delta):
	var limit_bottom = $Camera2D.limit_bottom
	Game.limit_bottom = limit_bottom
	Game.limit_top = position[1]-5000
	
func _physics_process(_delta):

	
	if clicked and Game.playable:
		# Save new position
		var new_pos = get_parent().get_global_mouse_position()
		# Accessing space in order to make raycast query from old to new position
		var space_state = get_world_2d().direct_space_state
		var ray = space_state.intersect_ray(global_position, new_pos, [self])
		
		# Check if ray hits anything
		if ray:
				# Give player invincibility tag when coin is collected
			if ray.collider.is_in_group("coin"):
				
				invincible = true
			# Check for invincibility when hit by obstacle
			if (ray.collider.is_in_group("obstacle")):
				if !invincible and vero ==false:
					clicked = false
					Game.save(Game.score)
					#get_tree().change_scene("res://Scenes/GameOver.tscn")
					_player_died()
									
				if invincible:
				
					vero = true
					invincible = false
				else:
					vero = false

		var diff = new_pos -position
		Game.score -= diff[1]/100.0
		if Game.score > old_score +500:
			Game.scrolling_speed += 5
			old_score = Game.score
		
		get_parent().get_node("CanvasLayer/Control/Header").text = "Score: %s" % Game.score
		$Camera2D.limit_bottom += diff[1]*0.65
	
			
		# Move Player to clicked position
		position = new_pos
		if Game.sound == true:
			$AudioStreamPlayer.play()
		clicked = false
	if position[1] >= $Camera2D.limit_bottom:
		_player_died()
		#get_tree().change_scene("res://Scenes/GameOver.tscn")
		Game.save(Game.score)
func _player_died():
	Game.playable = false
	get_parent().get_parent().pause_mode = Node.PAUSE_MODE_STOP
	$Camera2D.current = false
	hide()
	get_parent().get_node("Revive").show()
	get_parent().get_node("Revive/Camera2D").current = true
	get_parent().get_node("Revive/AnimationPlayer").play("heart")




func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group("obstacle"):
		
		Game.save(Game.score)
		area.get_parent().queue_free()
		#get_tree().change_scene("res://Scenes/GameOver.tscn")
		_player_died()
