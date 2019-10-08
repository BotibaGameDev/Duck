extends Line2D

var target
var point
export(NodePath) var targetPath
export var trailLenght = 0

func _ready():
	position=get_parent().position
	target = get_node(targetPath)
	pass # Replace with function body.

func _process(delta):
	global_position=Vector2(0,0)
	global_rotation=0
	point = target.global_position
	add_point(point)
	while get_point_count() > trailLenght:
		remove_point(0)
	pass
