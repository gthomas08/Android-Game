extends Label


func _process(delta):
	set_text(str(Singleton.bestScore))