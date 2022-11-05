extends Control


func _on_StartButton_pressed():
	var error = get_tree().change_scene("res://Scenes/Game.tscn")
	if error != OK:
		push_error("Error whilst loading tile screen")


func _on_SettingsButton_pressed():
	pass



func _on_ShopButton_button_up():
	get_tree().change_scene("res://Scenes/Shop.tscn")


func _on_SettingsButton_button_up():
	get_tree().change_scene("res://Scenes/OptionsMenu.tscn")
