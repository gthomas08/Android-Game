extends Sprite

onready var mainMenu = get_node("../..")
onready var noAudioSprite = get_node("../noAudioSprite")

func _ready():
	if mainMenu.clicks%2 == 0:
		self.show()
	else:
		noAudioSprite.show()