extends KinematicBody2D
func _ready():
	$AnimationPlayer.play("ufo")
func _process(_delta):
	if !position.x > 720:
		position.x += 3
	else:
		position.x -= 3
