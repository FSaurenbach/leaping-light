extends Control
var clearer = preload("res://Scenes/Clearer.tscn").instance()
func _on_Button_button_up():
	add_child(clearer)
	#get_parent().get_node("Player").position = $Heart.position
	#get_parent().get_node("Player").position.y -=500
	get_parent().get_node("Player").show()
	get_parent().get_node("Player/Camera2D").current = true
	$Camera2D.current = false
	Game.playable = true
	hide()
	get_parent().get_node("Player").get_parent().pause_mode = Node.PAUSE_MODE_INHERIT
