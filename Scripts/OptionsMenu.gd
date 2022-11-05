extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _input(_event):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		Game.music = true
	else:
		Game.music = false


func _on_CheckBox2_toggled(button_pressed):
	if button_pressed:
		Game.sound = true
	else:
		Game.sound = false


func _on_Credits_button_up():
	get_tree().change_scene("res://Scenes/Credits.tscn")


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
