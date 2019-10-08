extends Node

onready var filePath = "user://saveGame.data"

var save = {
	"hs":0,
	"money":0,
	"lazerBonus":0,
	"slowBonus":0,
	"imuneBonus":0
	}
	
func _ready():
	load_game()
	pass 
	
# save FUNCTIONS ----------------------------------------------
func load_game():
	var file = File.new()
	if not file.file_exists(filePath): return
	file.open(filePath, File.READ)
	save = file.get_var()
	file.close()
	pass

func save_game():
	var file = File.new()
	file.open(filePath, File.WRITE)
	file.store_var(save)
	file.close()
	pass
	
func set_save(new_value,attribute):
	save[attribute] = new_value
	save_game()
	pass
	
