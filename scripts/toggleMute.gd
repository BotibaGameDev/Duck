extends Button
onready var soundOn = get_node("/root/Main").soundOn
var toggler =true
func _ready():
	if !soundOn:
		get_node("/root/Main").muteSound()
		pass
	pass 

func _process(delta):
	pass

func _on_toggleMute_pressed():
	toggler = true
	if soundOn and toggler:
		get_node("/root/Main").muteSound()
		soundOn = false
		toggler = false
	if !soundOn and toggler :
		get_node("/root/Main").resumeSound()
		toggler = false
		soundOn = true
	pass 


func _on_toggleMute_button_down():
	get_node("/root/Main/Menu").get_child(0).play("mutePressed")
	pass # Replace with function body.


func _on_toggleMute_button_up():
	get_node("/root/Main/Menu").get_child(0).play("muteReleased")
	pass # Replace with function body.
