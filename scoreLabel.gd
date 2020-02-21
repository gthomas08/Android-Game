extends Label

var finalScore = 0

func setFinalScore(var score):
	finalScore = score
	if finalScore > Singleton.bestScore:
		Singleton.bestScore = finalScore
		Singleton.save_bestScore()
	
func _process(delta):
	set_text(str(finalScore))
	