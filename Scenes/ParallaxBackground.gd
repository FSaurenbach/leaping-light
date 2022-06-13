extends ParallaxBackground
export (int) var scrolling_speed = 5
func _process(delta):
	scroll_offset.y += scrolling_speed*delta
