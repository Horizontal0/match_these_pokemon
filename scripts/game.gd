extends Control

@onready var pair = $HBoxContainer/VBoxContainer/MarginContainer/pair
@onready var grid_container = $HBoxContainer/GridContainer

#var menu :PackedScene = load("res://scenes/menu.tscn")
#@export var menu:PackedScene
var tile = preload("res://scenes/tile.tscn")
var level_data : Dictionary

func _ready():
	level_data = GameManager.get_level_selection()
	pair.text = "PAIR : %s" % level_data["pair_amounts"]
	grid_container.columns = level_data["cols_nums"]
	for tiles in level_data["image_list"]:
		add_tiles(tiles)

func add_tiles(tiles:Dictionary):
	var tile_instance = tile.instantiate()
	#print(tiles["image_texture"])
	grid_container.add_child(tile_instance)
	tile_instance.setup(tiles)

func _on_texture_button_pressed():
	#print(menu)
	#get_tree().change_scene_to_packed(menu)
	pass
