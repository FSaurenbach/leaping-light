extends ParallaxBackground
export (int) var scrolling_speed = 90
func _process(delta):
	if Game.playable:
		scroll_base_offset.y += scrolling_speed*delta*0.8
		get_parent().get_node("Player").position.y += scrolling_speed*delta*0.8
		
		get_parent().get_node("ScrollingBackground").position.y += scrolling_speed*delta
