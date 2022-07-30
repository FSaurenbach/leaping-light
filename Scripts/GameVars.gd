extends Node
var playable = false
var skin = "white"
var light_white = preload("res://Textures/light_white.png")
var light_blue = preload("res://Textures/light_blue.png")
var light_red = preload("res://Textures/light_red.png")
var limit_bottom = 0
var limit_top = 0
var score: int = 0/10
var sound = true
var music = true
var scrolling_speed = 90
var savegame = File.new() #file
var save_path = "user://score.txt" #place of the file
var save_data = {"highscore": 0} #var
func _ready():
	if !savegame.file_exists(save_path):
		savegame.open(save_path, File.WRITE)
		savegame.store_var(save_data)
		savegame.close()
func save(high_score = null, skin = null):    
	
   save_data["highscore"] += high_score #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # clo
func read_savegame():
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data["highscore"] #return the value
