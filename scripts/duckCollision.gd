extends Area2D
onready var retryButton = $"Buttons/Retry"
var duckcount=0
func _ready():
	pass 

func _process(delta):
	pass


func _on_Area2D_area_entered(area):
	if area.get_name() == "movingKnife" and get_node("/root/Main").imuneBonus == false:
		get_node("/root/Main/Buttons/imuneDuck").get_child(0).play("goAway")
		get_node("/root/Main/Buttons/addLazer").get_child(0).play("goAway")
		get_node("/root/Main/Buttons/slowDucks").get_child(0).play("goAway")
		get_node("/root/Main/background/Swamp/Fading").play("Fade")
		get_node("/root/Main/background").get_child(1).get_child(0).get_child(0).delete()
		#get_parent().emitSignal()#ducksignal.
		get_node("/root/Main/background").get_child(2).queue_free() #deleting the knife spawner
		get_node("/root/Main").instMenu()# getting the Menu back
		dyingDuck()
		get_parent().get_parent().get_parent().get_child(0).get_child(0).gameOn = false #changing gameOn in the fruit
		get_node("/root/Main/Menu/GameOver").gameOver = true # launching the animation in GameOver Label
		get_node("/root/Main").deleteDucks()
		#____________________high score_________________________________________________________________
		if get_node("/root/Main/").score > game.save["hs"]:
			game.set_save(get_node("/root/Main/").score,"hs")
			get_node("/root/Main/Menu/High score").set_text("Best: "+str(game.save["hs"]))
		#_______________________________________________________________________________________________
	if area.get_name() == "movingKnife" and get_node("/root/Main").imuneBonus == true:
		get_parent().get_child(3).get_child(0).play("imuneused")
		for i in range(get_node("/root/Main").ducksInField) :
				get_node("/root/Main/background").get_child(1).get_child(1).get_child(i).get_child(3).get_child(0).play("imuneused")
		get_node("/root/Main").imuneBonus = false
		get_node("/root/Main").bonusOn = false
		get_node("/root/Main/imune activated").queue_free()
		
		pass
	pass # Replace with function body.

func dyingDuck():
	get_node("/root/Main").ducksInField -=1
	get_node("/root/Main/sounds/Quack").play()
	get_parent().set_gravity_scale(5)
	get_parent().set_linear_velocity(Vector2(0,-200))
	get_parent().set_angular_velocity(40)
	pass
