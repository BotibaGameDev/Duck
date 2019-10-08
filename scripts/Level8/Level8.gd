extends Node2D

#variables-------------------------------------------------------------------

var fruitHit = -1
export var fruitHitMax = 4
export var duckSpeedRandMin = 60
export var duckSpeedRandMax = 160
export var bossHealth = 4
export var maxDucks = 3
var duckcount = 0

const scnFruit  = preload("res://scenes/Fruit.tscn")
const scnDuck  = preload("res://scenes/Levels/Level8/Duck8.tscn")
const scnHalfFruit  = preload("res://scenes/halfFruit.tscn")
const scnBoss  = preload("res://scenes/Levels/Level8/Boss8.tscn")

onready var fruitContainer = $"fruitContainer"
onready var duckContainer = $"duckContainer"
onready var halfFruitContainer = $"halfFruitContainer"

#functions-------------------------------------------------------------------

func _ready():
	print("This is Level 8")
	spawnDuck()
	spawnFruit()
	pass

func _process(delta):
	if get_child(3).position.x <= -28 and get_node("/root/Main").ducksInField <= 0:
		get_node("/root/Main").Level +=1
		get_node("/root/Main").gameOn = true
		queue_free()
	pass

func spawnFruit():
	fruitHit += 1
	if fruitHit < fruitHitMax:
		var newFruit = scnFruit.instance()
		fruitContainer.add_child(newFruit)
		newFruit.connect("fruitSignal", self, "spawnFruit")
		newFruit.connect("fruitSignal", self, "spawnHalfFruit", [newFruit.position.x, 1])
		newFruit.connect("fruitSignal", self, "spawnHalfFruit2", [newFruit.position.x, -1])
	else:
		spawnBoss()
	if fruitHit % 2 == 0 and fruitHit != 0 and duckContainer.get_child_count() < maxDucks:
		spawnDuck()
		pass


#______spawning half fruits _______________
func spawnHalfFruit(x,angle):
	var newHalfFruit = scnHalfFruit.instance()
	newHalfFruit.init(angle)
	halfFruitContainer.add_child(newHalfFruit)
	newHalfFruit.position = Vector2(x,13)
	pass

func spawnHalfFruit2(x,angle):
	spawnHalfFruit(x,angle)
	pass
#_______________________________________________

func spawnDuck():
	duckcount +=1
	randomize()
	var duckSpeed = rand_range(duckSpeedRandMin,duckSpeedRandMax)
	var newDuck = scnDuck.instance()
	if duckContainer.get_child_count() == 0:
		newDuck.position.y = 60
	else: newDuck.position.y = 30 * ( duckContainer.get_child_count() + 2) 
	randomize()
	var boool = randi()%2+1
	if boool == 1:
		newDuck.position.x = -23
		newDuck.init(duckSpeed, "right")
	elif boool == 2:
		newDuck.position.x = 154
		newDuck.init(duckSpeed*-1, "left")
	duckContainer.add_child(newDuck)
	pass

func spawnBoss():
	var newBoss = scnBoss.instance()
	fruitContainer.add_child(newBoss)
	newBoss.init(bossHealth)
	pass