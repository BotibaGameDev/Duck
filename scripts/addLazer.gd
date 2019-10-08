extends Button
onready var quantity = game.save["lazerBonus"]
var maxSpeed
var minSpeed

func _ready():
	pass 

func _process(delta):
	$"Label".set_text(str(quantity))
	pass

func _on_addLazer_pressed():
	get_child(0).play("pressed")
	if quantity >= 1:
		if get_node("/root/Main").lazerBonus == false:
			quantity -=1
			game.set_save(quantity, "lazerBonus")
			$"Label".set_text(str(quantity))
			get_node("/root/Main").lazerBonus = true
	pass 
