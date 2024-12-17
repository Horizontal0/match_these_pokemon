extends TextureButton

@onready var label = $Label

var game_tscn = load("res://scenes/game.tscn")
var level_selection : int

func _on_pressed():
	#print(GameManager.get_level_selection(level_selection))
	if level_selection == null:
		return
	GameManager.save_level_selection(level_selection)
	get_tree().change_scene_to_packed(game_tscn)
	

func update_label(level_number):
	level_selection = level_number
	label.text = "%s x %s" % [GameManager.levelK[level_number]["cols"],GameManager.levelK[level_number]["rows"]]
	
