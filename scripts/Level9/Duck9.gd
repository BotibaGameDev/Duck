extends RigidBody2D

signal duckSignal
var velocity
var direction 
var gameOn = true
export var duckSpeedRandMin = 60
export var duckSpeedRandMax = 160
var verro = true

func init(vel, dir):
	direction = dir
	velocity = vel
	pass
	

func emitSignal():
	emit_signal("duckSignal")
	pass
	
func _ready():
	get_node("/root/Main").ducksInField += 1
	set_linear_velocity(Vector2(velocity, get_linear_velocity().y))
	if direction == "right":
		changeSpriteDirection()
	pass 

func _process(delta):
	if (position.x < -40 or position.x > 180) and verro:
		get_node("/root/Main").ducksInField -= 1
		verro = false
	if position.x <= -30 and direction == "left" and gameOn:
		randomize()
		velocity = rand_range(duckSpeedRandMin,duckSpeedRandMax)
		set_linear_velocity(Vector2(velocity, get_linear_velocity().y))
		direction="right"
		changeSpriteDirection()
	if position.x >= 160 and direction == "right" and gameOn:
		velocity = rand_range(-1*duckSpeedRandMin,-1*duckSpeedRandMax)
		set_linear_velocity(Vector2(velocity, get_linear_velocity().y))
		direction="left"
		changeSpriteDirection()
	pass
	
func changeSpriteDirection():
	var s= get_child(0).get_scale().x * -1
	var z= get_child(0).get_scale().y 
	get_child(0).set_scale(Vector2(s,z))
	pass
