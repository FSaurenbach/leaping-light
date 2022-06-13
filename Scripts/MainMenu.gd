extends Node


func _ready():
	pass


func _on_StartButton_pressed():
	var error = get_tree().change_scene("res://Scenes/Game.tscn")
	if error != OK:
		push_error("Error whilst loading Game scene")


func _on_SettingsButton_pressed():
	pass


func _on_QuitButton_pressed():
	get_tree().quit()
