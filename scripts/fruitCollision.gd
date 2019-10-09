extends Area2D



func _ready():
	pass 
	
func _on_fruit_area_entered(area):
	if area.get_name() == "movingKnife":
		randomize()
		if rand_range(-1,1) > 0 :
			get_node("/root/Main").imuneBonus = true
			for i in range(get_node("/root/Main").ducksInField) :
				get_node("/root/Main/background").get_child(1).get_child(1).get_child(i).imuneOn = false
		
		get_node("/root/Main").lazerBonus = false
		get_node("/root/Main/sounds").get_child(2).play()
		get_parent().emitSignal()
		get_node("/root/Main/").score += 1
		game.set_save(get_node("/root/Main/").money+2,"money")
		get_node("/root/Main").money = game.save["money"]
		get_node("/root/Main/ui_container/money").set_text( str(get_node("/root/Main").money))
		get_parent().queue_free()
	pass # Replace with function body.
