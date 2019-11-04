extends RigidBody2D
onready var skin = get_node("/root/Main").skin
var pos = 1
var knifeSpeed = -500

func _ready():
	get_child(0).queue_free()
	add_child(skin.instance())
	if get_node("/root/Main").gunOn == true :
		get_node("/root/Main/gun activated").get_child(get_node("/root/Main").bullets).queue_free()
		get_node("/root/Main").bullets -=1
		knifeSpeed = -2000
		if get_node("/root/Main").bullets == 0 :
			get_node("/root/Main").gunOn = false
			get_node("/root/Main").bonusOn = false
			get_node("/root/Main/gun activated").queue_free()
	get_node("/root/Main/sounds").get_child(0).play()
	set_linear_velocity(Vector2(get_linear_velocity().x,knifeSpeed))
	pass 

func _process(delta):
	if position.y < -10:
		queue_free()
	pass