extends Node

#Best Score

var bestScore = 0 #setget set_bestScore

var filepath = "user://bestScore.txt"

func _ready():
	load_bestScore()
	load_storedClicks()

func load_bestScore():
	var file = File.new()
	if file.file_exists(filepath): 
		file.open(filepath, File.READ)
		var content = file.get_as_text()
		bestScore = int(content)
		file.close()
	
func save_bestScore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_string(str(bestScore))
	file.close()
	
#Mute clicks
	
var storedClicks = 2

var filepathC = "user://audio.txt"

func load_storedClicks():
	var file = File.new()
	if file.file_exists(filepathC): 
		file.open(filepathC, File.READ)
		var content = file.get_as_text()
		storedClicks = int(content)
		file.close()
	
func save_storedClicks():
	var file = File.new()
	file.open(filepathC, File.WRITE)
	file.store_string(str(storedClicks))
	file.close()
	
func simplify_storedClicks():
	if storedClicks%2 == 0:
		storedClicks = 2
	else:
		storedClicks = 3