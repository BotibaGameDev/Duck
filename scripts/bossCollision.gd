extends Area2D

func _on_boss_area_entered(area):
	if area.get_name() == "movingKnife":
		get_node("/root/Main").lazerBonus=false
		get_parent().get_node("trans").play("New Anim")
		#get_parent().get_node("Sprite").get_child(0).get_child(0).start()
		get_parent().health -= 1 
		get_node("/root/Main/sounds").get_child(3).play()
		if get_parent().health == 0:
			get_node("/root/Main/background").get_child(2).queue_free()
			get_node("/root/Main/sounds").get_child(4).play()
			get_node("/root/Main").score += get_parent().get_parent().get_parent().bossHealth 
			get_parent().emitSignal()
			#get_parent().get_parent().get_parent().get_child(3).get_child(0).play("nextLevel")
			get_node("/root/Main/").deleteDucks()
			
			get_parent().get_child(0).queue_free()
			get_parent().get_child(3).queue_free()
			get_node("/root/Main").Level +=1
			get_node("/root/Main/betweenLvls").start()

	pass 


