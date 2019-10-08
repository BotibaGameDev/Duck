extends Node2D
onready var money = game.save["money"]
var slowPrice = 15
var lazerPrice = 10
var imunePrice = 20

func _ready():
	$"buySlow/Label".set_text(str(get_node("/root/Main/Buttons/slowDucks").quantity))
	$"buyLazer/Label".set_text(str(get_node("/root/Main/Buttons/addLazer").quantity))
	$"buyImune/Label".set_text(str(get_node("/root/Main/Buttons/imuneDuck").quantity))
	pass 

func _on_buySlow_pressed():
	if money > slowPrice: 
		money -= slowPrice
		get_node("/root/Main").money = money
		game.set_save(money, "money")
		get_node("/root/Main/ui_container/money").set_text(str(money))
		get_node("/root/Main/Buttons/slowDucks").quantity+=1
		game.set_save(get_node("/root/Main/Buttons/slowDucks").quantity, "slowBonus")
		$"buySlow/Label".set_text(str(get_node("/root/Main/Buttons/slowDucks").quantity))
	pass 


func _on_buyLazer_pressed():
	if money > lazerPrice:
		money -= lazerPrice
		get_node("/root/Main").money = money
		game.set_save(money, "money")
		get_node("/root/Main/ui_container/money").set_text(str(money))
		get_node("/root/Main/Buttons/addLazer").quantity+=1
		game.set_save(get_node("/root/Main/Buttons/addLazer").quantity, "lazerBonus")
		$"buyLazer/Label".set_text(str(get_node("/root/Main/Buttons/addLazer").quantity))
	pass 


func _on_buyImune_pressed():
	if money > imunePrice:
		money -= imunePrice
		get_node("/root/Main").money = money
		game.set_save(money, "money")
		get_node("/root/Main/ui_container/money").set_text(str(money))
		get_node("/root/Main/Buttons/imuneDuck").quantity+=1
		game.set_save(get_node("/root/Main/Buttons/imuneDuck").quantity, "imuneBonus")
		$"buyImune/Label".set_text(str(get_node("/root/Main/Buttons/imuneDuck").quantity))
	pass 


func _on_exit_pressed():
	get_child(0).play("goAway")
	get_node("/root/Main/Buttons/Start").get_child(0).play("come")
	get_node("/root/Main/Buttons/store").get_child(0).play("come")
	pass 
