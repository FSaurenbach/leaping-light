extends ParallaxBackground

func _ready():
	scroll_base_offset.y += Game.scrolling_speed*0.8
		
		
func _process(delta):
	get_parent().get_node("Player").position.y += Game.scrolling_speed*0.8*delta
	get_parent().get_node("ScrollingBackground").position.y += Game.scrolling_speed*delta
