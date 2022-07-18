extends ParallaxBackground

func _process(delta):
	if Game.playable:
		scroll_base_offset.y += Game.scrolling_speed*delta*0.8
		get_parent().get_node("Player").position.y += Game.scrolling_speed*delta*0.8
		
		get_parent().get_node("ScrollingBackground").position.y += Game.scrolling_speed*delta*3
