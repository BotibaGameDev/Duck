extends RigidBody2D

signal bossSignal
var health
var gameOn = true

func init(h):
	health=h
	get_node("bar").max_value = health
	pass

func _ready():
	randomize()
	var pos_x = rand_range(30,110)
	position = Vector2(pos_x,-10)
	set_linear_velocity(Vector2 (0,30))
	pass 

func _process(delta):
	if health > 0: get_node("bar").set_value(health)
	if position.y <=-15:
		queue_free()
	if position.y >= 20 and gameOn:
		set_linear_velocity(Vector2 (0,0))
	pass

func emitSignal():
	emit_signal("bossSignal")
	pass

func delete():
	set_linear_velocity(Vector2 (0,-80))
	pass