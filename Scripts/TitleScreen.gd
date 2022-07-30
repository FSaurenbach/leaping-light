extends Node


func _ready():
	if Game.music == true:
		$AudioStreamPlayer.play()
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
	else:
		no_money(5000-Game.read_savegame())
	print(Game.read_savegame())

func _on_BackButton_button_up():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_RedPlayer_button_up():
	print(Game.read_savegame())
	if Game.read_savegame() >= 5000:
		Game.save(-5000)
		Game.skin = "red"
	else:
		
		no_money(5000-Game.read_savegame())
		
	print(Game.read_savegame())
func no_money(balance):
	$NoMoneyPopup.get_child(0).text = "Insuffficent coin balance You need %s more" % str(balance)
	$NoMoneyPopup.popup()
