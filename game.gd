extends Node

onready var pausePopupMenu = get_node("pausePopupMenu")
onready var pauseSprite = get_node("pauseButton/pauseSprite")
onready var hammerKinematic = get_node("hammerKinematic")

onready var mainClickSound = get_node("mainClickSound")
onready var sideClickSound = get_node("sideClickSound")
onready var throwSound = get_node("hammerKinematic/throwSound")

onready var playerAnimation = get_node("playerSprite/playerAnimation")

var hammerMotion = -1500

func _on_pauseButton_pressed():
	sideClickSound.play()
	pauseSprite.hide()
	get_tree().paused = true
	pausePopupMenu.show()

func _on_resumeButton_pressed():
	mainClickSound.play()
	pauseSprite.show()
	pausePopupMenu.hide()
	get_tree().paused = false

func _on_mainMenuButton_pressed():
	mainClickSound.play()
	get_tree().paused = false
	get_tree().change_scene("res://mainMenu.tscn")

func _on_playAgainButton_pressed():
	get_tree().paused = false
	mainClickSound.play()
	get_tree().change_scene("res://game.tscn")

func _on_hammerButton_pressed():
	throwSound.play()
	playerAnimation.play("playerAnimation")
	hammerKinematic.motion.y = hammerMotion

func _on_Timer_timeout():
	hammerKinematic.success_hit()
