extends Button

onready var audioSprite = get_node("audioSprite")
onready var noAudioSprite = get_node("noAudioSprite")

func _ready():
	if Singleton.storedClicks%2 == 0:
		audioSprite.show()
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
	else:
		noAudioSprite.show()
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)