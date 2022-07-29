extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	$Money.text = str(Game.read_savegame())
	
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")




func _on_BluePlayer_button_up():
	print(Game.read_savegame())
	if Game.read_savegame() >= 5000:
		Game.save(-5000)
		Game.skin = "blue"
	print(Game.read_savegame())

func _on_BackButton_button_up():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_RedPlayer_button_up():
	print(Game.read_savegame())
	if Game.read_savegame() >= 5000:
		Game.save(-5000)
		Game.skin = "red"
	else:
		pass
		
	print(Game.read_savegame())
func no_money():
	pass
