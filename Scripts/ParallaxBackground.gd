extends ParallaxBackground
export (int) var scrolling_speed = 90
func _process(delta):
	scroll_offset.y += scrolling_speed*delta*0.3
	get_parent().get_node("ScrollingBackground").position.y += scrolling_speed*delta
