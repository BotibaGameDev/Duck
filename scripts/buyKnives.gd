extends Node2D
onready var main = get_node("/root/Main")

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass


func _on_skin1_pressed():
	$animation.play("skin1Pressed")
	main.skin = main.skin1
	pass 





func _on_skin0_pressed():
	$animation.play("skin0Pressed")
	main.skin = main.skin0
	pass
