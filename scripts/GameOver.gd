extends Node
onready var retry = $"Retry"
onready var gameOverText = $"Label"
onready var scn_spawner = preload("res://scenes/spawner.tscn")
onready var scn_spawnerKnife = preload("res://scenes/spawnerKnife.tscn")
var gameOn = true
func _ready():
	pass 

func _process(delta):
	if get_child(1).rect_position.y < -15 and gameOn:
		callSpawner()
		callSpawnerKnife()
		gameOn = false
	pass
	pass


func _on_Button_pressed():
	retry.get_child(0).play("goAway")
	gameOverText.get_child(0).play("goAway")
	
	pass 
#spawners-------------------------------------------------------------
func callSpawner():
	add_child(scn_spawner.instance())
	pass
func callSpawnerKnife():
	add_child(scn_spawnerKnife.instance())
	pass
#---------------------------------------------------------------------
