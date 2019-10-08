extends Node
onready var menu = preload("res://scenes/Menu.tscn")
onready var scn_spawnerKnife = preload("res://scenes/Levels/Knife/spawnerKnife.tscn")

onready var money = game.save["money"]


var Level = 1
var score = 0
var ducksInField = 0
var gameOn = false #true means the game can start, false means the game already started
var soundOn = true
var storeOpen = false
# Bonus variables-----------------------------------------------------
var slowBonus = false
var lazerBonus = false
var imuneBonus = false
#---------------------------------------------------------------------
func instMenu():
	add_child(menu.instance())
	pass
func _ready():
	instMenu()
	get_node("sounds").get_child(1).play()
	get_node("Menu/High score").set_text("Best: "+ str(game.save["hs"]))
	get_node("ui_container/money").set_text( str(money))
	pass 
	
func _process(delta):
	get_node("ui_container/score").set_text(str(score))
	if gameOn and ducksInField ==0 :
		if Level == 1:
			if get_node("/root/Main/background").get_child_count() >1:
				get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(one)
			gameOn = false
		if Level == 2:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(two)
			gameOn = false
		if Level == 3:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(three)
			gameOn = false
		if Level == 4:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(four)
			gameOn = false
		if Level == 5:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(five)
			gameOn = false
		if Level == 6:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(six)
			gameOn = false
		if Level == 7:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(seven)
			gameOn = false
		if Level == 8:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(eight)
			gameOn = false
		if Level == 9:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(nine)
			gameOn = false
		if Level == 10:
			get_node("/root/Main/background").get_child(1).queue_free()
			callBothSpawners(ten)
			gameOn = false
		
	
		
	pass
#spawners-------------------------------------------------------------
func callBothSpawners(level):
	callSpawner(level)
	callSpawnerKnife()
	pass
func callSpawner(level):
	var i =level
	get_child(0).add_child(i.instance())
	pass
func callSpawnerKnife():
	get_child(0).add_child(scn_spawnerKnife.instance())
	pass
#buttons stuff---------------------------------------------------------------------
func _on_Button_pressed(): 
	Level = 1
	if get_node("/root/Main/Menu/GameOver").rect_position.y >= 0: # so you can't click on the button while it's moving
		get_node("/root/Main/Menu/GameOver").go()# gameOver vanish
	get_node("/root/Main/Buttons/imuneDuck").get_child(0).play("come")
	get_node("/root/Main/Buttons/addLazer").get_child(0).play("come")
	get_node("/root/Main/Buttons/slowDucks").get_child(0).play("come")
	freeOtherButtons()
	get_node("/root/Main/background/Swamp/Fading").play("Unfade")
	gameOn = true
	$"Menu/Start".gameOn= false
	pass 
	
func freeOtherButtons():
	get_node("/root/Main/Menu/store").get_child(0).play("goAway")
	get_node("Menu/toggleMute/AnimationPlayer").play("goAway")
	$"Menu/Start".clear()
	pass

func deleteDucks():
	var duckContainer = get_child(0).get_child(1).get_node("duckContainer")
	for i in range(0, duckContainer.get_child_count()):
		duckContainer.get_child(i).gameOn = false
	pass
func muteSound():
	var sounds=get_node("/root/Main/sounds")
	for i in range(1,sounds.get_child_count()+1):
		sounds.get_child(i-1).set_volume_db(-80)
		pass
	soundOn=false
	get_node("Menu/toggleMute/Sprite").set_modulate("ffffff")
	print("sound muted")
func resumeSound():
	soundOn=true
	var sounds=get_node("/root/Main/sounds")
	for i in range(1,sounds.get_child_count()+1):
		sounds.get_child(i-1).set_volume_db(0)
		pass
	get_node("Menu/toggleMute/Sprite").set_modulate("00ffffff")
	print("sound resumed")
	get_node("sounds/background").play()

# Levels --------------------------------------------------------
onready var one = preload("res://scenes/Levels/Level1/Level1.tscn")
onready var two = preload("res://scenes/Levels/Level2/Level2.tscn")
onready var three = preload("res://scenes/Levels/Level3/Level3.tscn")
onready var four = preload("res://scenes/Levels/Level4/Level4.tscn")
onready var five = preload("res://scenes/Levels/Level5/Level5.tscn")
onready var six = preload("res://scenes/Levels/Level6/Level6.tscn")
onready var seven = preload("res://scenes/Levels/Level7/Level7.tscn")
onready var eight = preload("res://scenes/Levels/Level8/Level8.tscn")
onready var nine = preload("res://scenes/Levels/Level9/Level9.tscn")
onready var ten = preload("res://scenes/Levels/Level10/Level10.tscn")

func _on_betweenLvls_timeout():
	print("time out")
	gameOn= true
	pass 
