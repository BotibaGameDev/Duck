extends RigidBody2D
onready var scn_lazer =preload("res://scenes/lazer.tscn")
var onetime = true

func _ready():
	#set_linear_velocity(Vector2(get_linear_velocity().x,-250))
	pass 

func _process(delta):
	if get_node("/root/Main").lazerBonus and onetime:
		addLazer()
		onetime = false
	get_input()
	pass

func get_input():
	if Input.is_action_pressed('mouseLeft'):
		position.x=get_global_mouse_position().x 
	if Input.is_action_just_released('mouseLeft'):
		queue_free()
		pass
func addLazer():
	add_child(scn_lazer.instance())
	pass
