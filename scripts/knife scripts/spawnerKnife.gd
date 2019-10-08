extends Node2D

const scnKnife  = preload("res://scenes/Levels/Knife/Knife.tscn")
const scnMovingKnife  = preload("res://scenes/Levels/Knife/movingKnife.tscn")
onready var container = $"container"
onready var container2 = $"container2"
var knifeSpawned = false



func _ready():
	randomize()
	pass 

func _process(delta):
	position.x=get_global_mouse_position().x 
	get_input()
	pass

func spawnKnife():
	var newKnife = scnKnife.instance()
	newKnife.position.x = position.x
	newKnife.position.y = 200
	container2.add_child(newKnife)
	pass
	
func spawnMovingKnife():
	var newMovingKnife = scnMovingKnife.instance()
	newMovingKnife.position.x = position.x
	newMovingKnife.position.y = 200
	container.add_child(newMovingKnife)
	pass
	

		
func get_input():
	var n = container.get_child_count()
	if Input.is_action_just_pressed('mouseLeft') and get_global_mouse_position().y>=150 and get_global_mouse_position().y <=230:
		spawnKnife()
		knifeSpawned = true
	#if n < 1:
	if Input.is_action_just_released('mouseLeft')and knifeSpawned and get_global_mouse_position().y>=150:
		spawnMovingKnife()
		knifeSpawned=false
