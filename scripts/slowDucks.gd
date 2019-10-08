extends Button
onready var quantity = game.save["slowBonus"]
var maxSpeed
var minSpeed

func _ready():
	pass 

func _process(delta):
	$"Label".set_text(str(quantity))
	pass

func activate():
	maxSpeed = get_node("/root/Main/background").get_child(1).duckSpeedRandMax
	minSpeed = get_node("/root/Main/background").get_child(1).duckSpeedRandMin
	for i in range(0,get_node("/root/Main/background").get_child(1).get_child(1).get_child_count()):
		var duck =get_node("/root/Main/background").get_child(1).get_child(1).get_child(i)
		if duck.get_linear_velocity().x > 0 :
			duck.set_linear_velocity(Vector2(duck.get_linear_velocity().x-50, duck.get_linear_velocity().y))
		if duck.get_linear_velocity().x < 0 :
			duck.set_linear_velocity(Vector2(duck.get_linear_velocity().x+50, duck.get_linear_velocity().y))
		duck.duckSpeedRandMax -=50
		duck.duckSpeedRandMin -=50
	get_node("/root/Main").slowBonus = true
	get_child(1).start()
	pass

func desactivate():
	for i in range(0,get_node("/root/Main/background").get_child(1).get_child(1).get_child_count()):
		var duck =get_node("/root/Main/background").get_child(1).get_child(1).get_child(i)
		duck.duckSpeedRandMax =maxSpeed
		duck.duckSpeedRandMin =minSpeed
		if duck.get_linear_velocity().x > 0 :
			duck.set_linear_velocity(Vector2(rand_range(maxSpeed,minSpeed), duck.get_linear_velocity().y))
			#print(duck.get_linear_velocity().x)
		if duck.get_linear_velocity().x < 0 :
			duck.set_linear_velocity(Vector2(-rand_range(maxSpeed,minSpeed), duck.get_linear_velocity().y))
			#print(duck.get_linear_velocity().x)
	get_node("/root/Main").slowBonus = false
	pass


func _on_slowDucks_pressed():
	get_child(0).play("pressed")
	if quantity >= 1:
		if get_node("/root/Main").slowBonus == false :
			quantity -=1
			game.set_save(quantity, "slowBonus")
			$"Label".set_text(str(quantity))
			activate()
			get_node("/root/Main").slowBonus = true
	pass 


func _on_Timer_timeout():
	get_node("/root/Main").slowBonus = false
	desactivate()
	pass 
