extends KinematicBody2D

var heartCounter = 0
var pointsCounter = 0

var motion = Vector2()
var startPosition = Vector2(233, 636)

onready var pcParticles = get_node("../pcKinematic/pcParticles")

onready var pauseSprite = get_node("../pauseButton/pauseSprite")

onready var scoreCounter = get_node("../scoreCounter")

onready var lossPopupMenu = get_node("../lossPopupMenu")
onready var scoreNumberLabel = get_node("../lossPopupMenu/scoreNumberLabel")

onready var hammerRaycast = get_node("hammerRaycast")
onready var pcKinematic = get_node("../pcKinematic")
onready var circleKinematic = get_node("../circleKinematic")
onready var circleSprite = get_node("../circleKinematic/circleSprite")

onready var pcSprite = get_node("../pcKinematic/pcSprite")

onready var heartFull3 = get_node("../heartsHUD/heartFull3")
onready var heartFull2 = get_node("../heartsHUD/heartFull2")
onready var heartFull1 = get_node("../heartsHUD/heartFull1")

onready var pcTimer = get_node("../pcTimer")

onready var game = get_node("..")

onready var pcAudioExplosion = get_node("../pcKinematic/pcAudioExplosion")
onready var hitSound = get_node("../circleKinematic/hitSound")

func _physics_process(delta):
		
	move_and_slide(motion)
	
	var arrayHearts = [heartFull3, heartFull2, heartFull1]

	if  hammerRaycast.is_colliding() and hammerRaycast.get_collider() == pcKinematic:
		pcParticles.restart()
		pcAudioExplosion.play()
		motion.y = 0
		set_global_position(startPosition)
		pointsCounter+=1
		scoreCounter.set_text(str(pointsCounter))
		hide()
		pcSprite.hide()
		pcTimer.start()
	
	if  hammerRaycast.is_colliding() and hammerRaycast.get_collider() == circleKinematic:
		hitSound.play()
		if heartCounter < 3:
			arrayHearts[heartCounter].hide()
		heartCounter+=1
		set_global_position(startPosition)
		motion.y = 0
	
	if heartCounter == 3:
		get_tree().paused = true
		pauseSprite.hide()
		scoreNumberLabel.setFinalScore(pointsCounter)
		lossPopupMenu.show()


func success_hit():
	show()
	pcSprite.show()
	set_global_position(startPosition)
	pcKinematic.speedTarget *= 1.15
	circleSprite.speedCircle *= 1.15
	game.hammerMotion *= 0.98