extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")




func _on_BluePlayer_button_up():
	Game.skin = "blue"


func _on_BackButton_button_up():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_RedPlayer_button_up():
	Game.skin = "red"
