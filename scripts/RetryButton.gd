extends Button
#Variables------------------------------------------------------------
onready var A = preload("res://scenes/Levels/Level1/Level1.tscn")
var gameOn = true
#functions------------------------------------------------------------
func _ready():
	pass 

func go():
	get_child(0).play("goAway")
	get_node("/root/Main/High score").get_child(0).play("hide")
	get_node("/root/Main/Buttons/toggleMute/AnimationPlayer").play("goAway")
	pass
func come():
	get_node("/root/Main/Buttons/store").get_child(0).play("come")
	get_child(0).play("come")
	get_node("/root/Main/High score").get_child(0).play("show")
	get_node("/root/Main/Buttons/toggleMute/AnimationPlayer").play("come")
	pass


func _process(delta):
	if rect_position.x >=205 and !gameOn:
		get_node("/root/Main/Buttons/store").get_child(0).play("goAway")
		get_node("/root/Main/Buttons/imuneDuck").get_child(0).play("come")
		get_node("/root/Main/Buttons/addLazer").get_child(0).play("come")
		get_node("/root/Main/Buttons/slowDucks").get_child(0).play("come")
		get_node("/root/Main/background").get_child(1).queue_free()
		get_node("/root/Main").callBothSpawners(A)
		gameOn = true
		get_node("/root/Main/").Level = 1
		get_node("/root/Main/").score = 0
		
	pass


func _on_Retry_pressed():
	get_node("/root/Main").ducksInField = 0 # i fucking can
	if rect_position == Vector2(43,95): # so you can't click on the button while it's moving
		go() 
		get_node("/root/Main/background/Swamp/Fading").play("Unfade")
		gameOn= false 
		get_node("../GameOver").go()# gameOver vanish
	pass 