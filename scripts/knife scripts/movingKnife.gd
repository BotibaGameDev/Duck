extends RigidBody2D

var pos = 1
var knifeSpeed = -500

func _ready():
	get_node("/root/Main/sounds").get_child(0).play()
	set_linear_velocity(Vector2(get_linear_velocity().x,knifeSpeed))
	pass 

func _process(delta):
	if position.y < -10:
		queue_free()
	pass