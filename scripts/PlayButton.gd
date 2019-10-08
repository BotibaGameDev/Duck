extends Button
onready var A = preload("res://scenes/Levels/Level1/Level1.tscn")
var gameOn = true

func _ready():
	pass 
	
func clear():
	get_child(0).play("goAway")
	get_node("/root/Main/Menu/High score").get_child(0).play("hide")
	get_node("/root/Main/Menu/toggleMute/AnimationPlayer").play("goAway")
	pass

func _process(delta):
	if rect_position.x >=205 and !gameOn:
		gameOn = true
		get_node("/root/Main/").Level = 1
		get_node("/root/Main/").score = 0
	pass

func go():
	get_child(0).play("goAway")
	get_node("/root/Main/Menu/High score").get_child(0).play("hide")
	get_node("/root/Main/Menu/toggleMute/AnimationPlayer").play("goAway")
	pass
func come():
	get_node("/root/Main/Menu/store").get_child(0).play("come")
	get_child(0).play("come")
	get_node("/root/Main/Menu/High score").get_child(0).play("show")
	get_node("/root/Main/Menu/toggleMute/AnimationPlayer").play("come")
	pass