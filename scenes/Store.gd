extends Node2D
onready var scn_buySpell = preload("res://scenes/buySpell.tscn")
onready var scn_buyknives = preload("res://scenes/buyKnives.tscn")
var storePage= "spells"

func _ready():
	get_child(0).play("come")
	pass 

func _process(delta):
	pass

func _on_exit_pressed():
	get_child(0).play("goAway")
	get_node("/root/Main/Menu").get_child(0).play("come")
	$"/root/Main/Menu/Timer".start()
	pass # Replace with function body.


func _on_knives_pressed():
	get_child(0).play("knivesPressed")
	if storePage == "spells":
		get_node("buySpell").queue_free()
		add_child(scn_buyknives.instance())
		pass
	storePage="knives"
	pass # Replace with function body.


func _on_spells_pressed():
	get_child(0).play("spellsPressed")
	if storePage == "knives":
		get_node("buyKnives").queue_free()
		add_child(scn_buySpell.instance())
		pass
	storePage="spells"
	pass # Replace with function body.
