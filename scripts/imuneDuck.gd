extends Button
onready var quantity = game.save["imuneBonus"]
func _ready():
	pass # Replace with function body.

func _process(delta):
	$"Label".set_text(str(quantity))
	pass


func _on_imuneDuck_pressed() :
	get_child(0).play("pressed")
	if quantity <=1:
		if get_node("/root/Main").imuneBonus == false :
			quantity -=1
			game.set_save(quantity, "imuneBonus")
			$"Label".set_text(str(quantity))
			get_node("/root/Main").imuneBonus = true
	pass 
