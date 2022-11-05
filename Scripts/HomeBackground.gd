extends Sprite
export (int) var scrolling_speed = 90
func _process(delta):
	position.x += 50	
	position.y +=50
	position.x -= 50
	position.y -=50
		
