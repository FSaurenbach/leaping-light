extends KinematicBody2D
var vero = true
func _ready():
	$AnimationPlayer.play("ufo")
func _process(_delta):
	if vero:
		position.x += 3
		if int(position.x) == 300:
			vero = false
	elif !vero:
		position.x -= 3
		if int(position.x) == 0:
			vero = true
	
