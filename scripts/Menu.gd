extends Node2D
onready var scn_store = preload("res://scenes/Store.tscn")
var storeOpen=false
var done = false
func _ready():
	get_child(0).play("come")
	get_node("Timer").start()
	pass 

func _process(delta):
	if position.y < -251 and !done:
		$"/root/Main".gameOn = true
		done = true
		queue_free()
		pass
	pass


func _on_Start_pressed():
	if storeOpen == false :
		$"/root/Main".Level = 1
		$"/root/Main".score = 0
		get_child(0).play("go")
		get_node("/root/Main/background/Swamp/Fading").play("Unfade")
		$"/root/Main/Menu/Start".gameOn= false
	pass 


func _on_store_pressed():
	storeOpen=true
	get_child(0).play("moveOut")
	$"/root/Main".add_child(scn_store.instance())
	pass 


func _on_Timer_timeout():
	get_child(0).play("moving")
	pass # Replace with function body.
