extends RigidBody2D

var rot
var boul

func init(b):
	boul=b
	pass


func _ready():
	randomize()
	rot = rand_range(0,5)
	set_angular_velocity(rot*boul)
	set_linear_velocity(Vector2 (rand_range(10,80)*boul,rand_range(-120,-80))) 
	pass 

func _process(delta):
	if position.y >= 260:
		queue_free()
	pass
