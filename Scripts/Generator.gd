extends Node2D
var rocket_resource = preload("res://Scenes/Obstacle2_Rocket.tscn")
var meteor_resource = preload("res://Scenes/Obstacle_Meteor_1.tscn")
var timer = Timer.new()
var rng = RandomNumberGenerator.new()
export (float) var wait_time = 0.1
var i = 0
func _ready():
	timer.connect("timeout",self,"do_this")
	
	timer.wait_time = wait_time
	timer.one_shot = false
	
	add_child(timer)
	_start_timer()
func _start_timer():
	timer.start()
	
	return
	#rocket.set_pos(100.0,100.0) # use set_translation() if you are in 3D
	#add_child(rocket) # parent could be whatever node in the scene that you want the car to be child of
	
func do_this():
	var rocket = meteor_resource.instance()
	rng.randomize()
	var m = rng.randi_range(1,2)
	if m == 1:
		rocket = rocket_resource.instance()
	if m == 2:
		rocket = meteor_resource.instance()
	rng.randomize()
	var new_position_x = rng.randf_range(-500.0, 800.0)
	var new_position_y = rng.randf_range(Game.limit_bottom,Game.limit_top)
	rocket.set_position(Vector2(new_position_x,new_position_y)) # use set_translation() if you are in 3D
	rocket.set_name("rocket "+ str(i))
	i+=1
	get_parent().get_node("ScrollingBackground").add_child(rocket) # parent could be whatever node in the scene that you want the car to be child of
	_start_timer()
	
