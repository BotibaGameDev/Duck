extends Area2D
onready var imuneActivated_scn = preload("res://scenes/imune activated.tscn")
onready var gunActivated_scn = preload("res://scenes/gun activated.tscn")
onready var slowActivated_scn = preload("res://scenes/slow activated.tscn")
var proc

func _ready():
	pass 
	
func _on_fruit_area_entered(area):
	if area.get_name() == "movingKnife":
		randomize()
		proc = randi()%3+1
		print(proc)
		if proc == 1 and get_node("/root/Main").bonusOn == false :
			get_node("/root/Main").pause_shooting()
			get_node("/root/Main").imuneBonus = true
			get_node("/root/Main").bonusOn = true
			get_node("/root/Main").add_child(imuneActivated_scn.instance())
			get_node("/root/Main/imune activated/animation").play("On")
			get_node("/root/Main/background/Swamp/Fading").play("fade for bonus")
			for i in range(get_node("/root/Main").ducksInField) :
				get_node("/root/Main/background").get_child(1).get_child(1).get_child(i).imuneOn = false
		if proc == 2 and get_node("/root/Main").bonusOn == false :
			get_node("/root/Main").pause_shooting()
			get_node("/root/Main").bullets = 4
			get_node("/root/Main").gunOn = true
			get_node("/root/Main").bonusOn = true
			get_node("/root/Main/background/Swamp/Fading").play("fade for bonus")
			get_node("/root/Main").add_child(gunActivated_scn.instance())
			get_node("/root/Main/gun activated/GUN/animation").play("gun activated")
		if proc == 3 and get_node("/root/Main").bonusOn == false and get_node("/root/Main").slowBonus == false:
			get_node("/root/Main").pause_shooting()
			get_node("/root/Main").bonusOn = true
			get_node("/root/Main").slowBonus = true
			get_node("/root/Main/Buttons/slowDucks").activate()
			get_node("/root/Main/background/Swamp/Fading").play("fade for bonus")
			get_node("/root/Main").add_child(slowActivated_scn.instance())
			get_node("/root/Main/slow activated/icon/animation").play("slow activated")
		
		get_node("/root/Main").lazerBonus = false
		get_node("/root/Main/sounds").get_child(2).play()
		get_parent().emitSignal()
		get_node("/root/Main/").score += 1
		game.set_save(get_node("/root/Main/").money+2,"money")
		get_node("/root/Main").money = game.save["money"]
		get_node("/root/Main/ui_container/money").set_text( str(get_node("/root/Main").money))
		get_parent().queue_free()
	pass
