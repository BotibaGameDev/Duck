extends Label

onready var gameOver = false
func _ready():
	pass # Replace with function body.

func _process(delta):
	if gameOver :
		get_child(0).play("Come")
		gameOver = false
	pass
func go():
	get_child(0).play("goAway")
	pass
