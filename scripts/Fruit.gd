extends RigidBody2D

signal fruitSignal
var gameOn = true
func _ready():
	randomize()
	var pos_x = rand_range(10,134)
	position = Vector2(pos_x,-10)
	set_linear_velocity(Vector2 (0,80))
	pass 

func _process(delta):
	if position.y <=-15:
		queue_free()
	if position.y >= 20 and gameOn:
		set_linear_velocity(Vector2 (0,0))
	pass

func emitSignal():
	emit_signal("fruitSignal")
	pass

func delete():
	set_linear_velocity(Vector2 (0,-80))
	pass