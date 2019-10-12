extends RigidBody2D

#boss11: rolling at stable speed but changing direction randomly every 2.5 sec
signal bossSignal
var health
var gameOn = true
var direction = "right"
var speed = 25
var rolling = 2
#export var speedRandMin = 15
#export var speedRandMax = 40
var randops

func init(h):
	health=h
	get_node("bar").max_value = health
	pass

func _ready():
	get_node("Timer").start()
	randomize()
	var pos_x = rand_range(30,110)
	position = Vector2(pos_x,-10)
	set_linear_velocity(Vector2 (linear_velocity.x,40))
	pass 

func _process(delta):
	if health > 0: get_node("bar").set_value(health)
	if position.y <=-15:
		queue_free()
	if position.y >= 20 and gameOn and direction=="right":
		set_linear_velocity(Vector2 (linear_velocity.x,0))
		linear_velocity.x= speed 
		angular_velocity = rolling #rolling
		#rolling_________________________________
	if position.x > 130 and direction=="right":
		linear_velocity.x= speed*-1
		angular_velocity = rolling*-1
		direction="left"
	if position.x < 20 and direction=="left":
		linear_velocity.x= speed 
		angular_velocity = rolling
		direction="right"
	pass

func emitSignal():
	emit_signal("bossSignal")
	pass

func delete():
	set_linear_velocity(Vector2 (0,-80))
	pass

func changeDirection():
	if direction=="right":
		linear_velocity.x= speed*-1
		angular_velocity = rolling*-1
		direction="left"
	if direction=="left":
		linear_velocity.x= speed 
		angular_velocity = rolling
		direction="right"
	pass

func _on_Timer_timeout():
	randomize()
	randops = rand_range(1,100)
	if randops > 30:
		changeDirection()
	pass 
