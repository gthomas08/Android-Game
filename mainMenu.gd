extends Node2D

onready var infoPopupMenu = get_node("infoPopupMenu")
onready var mainClickSound = get_node("mainClickSound")
onready var sideClickSound = get_node("sideClickSound")

onready var audioSprite = get_node("muteButton/audioSprite")
onready var noAudioSprite = get_node("muteButton/noAudioSprite")

func _on_playButton_pressed():
	mainClickSound.play()
	get_tree().change_scene("res://game.tscn")

func _on_quitButton_pressed():
	mainClickSound.play()
	get_tree().quit()

func _on_infoButton_pressed():
	sideClickSound.play()
	get_tree().paused = true
	infoPopupMenu.show()

func _on_closeButton_pressed():
	sideClickSound.play()
	infoPopupMenu.hide()
	get_tree().paused = false


func _on_muteButton_pressed():
	if Singleton.storedClicks%2 == 0:
		audioSprite.hide()
		noAudioSprite.show()
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
		Singleton.storedClicks+=1
		Singleton.simplify_storedClicks()
		Singleton.save_storedClicks()
		
	else:
		audioSprite.show()
		noAudioSprite.hide()
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
		Singleton.storedClicks+=1
		Singleton.simplify_storedClicks()
		Singleton.save_storedClicks()