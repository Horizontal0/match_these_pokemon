extends Control

@onready var mister_incredible = $Mister_Incredible
@onready var grid_container = $HBoxContainer/GridContainer
@onready var pair = $HBoxContainer/VBoxContainer/MarginContainer/pair
@onready var move = $HBoxContainer/VBoxContainer/MarginContainer/move
@onready var time = $HBoxContainer/VBoxContainer/MarginContainer/time

#var menu :PackedScene = load("res://scenes/menu.tscn")
#@export var menu:PackedScene
var tile = preload("res://scenes/tile.tscn")
var level_data : Dictionary

func _ready():
	level_data = GameManager.get_level_selection()
	update_label()
	grid_container.columns = level_data["cols_nums"]
	for tiles in level_data["image_list"]:
		add_tiles(tiles)

func _process(delta):
	update_label()

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func add_tiles(tiles:Dictionary):
	var tile_instance = tile.instantiate()
	#print(tiles["image_texture"])
	print(level_data["cols_nums"])
	if level_data["cols_nums"] > 5:
		tile_instance.scale.x *= 5/level_data["cols_nums"]
		tile_instance.scale.y *= 5/level_data["cols_nums"]
	grid_container.add_child(tile_instance)
	tile_instance.setup(tiles)

func _on_texture_button_pressed():
	GameManager.load_main_menu()

func update_label():
	pair.text = "PAIR : %s/%s" % [
			mister_incredible.get_values().pairs_done,
			level_data["pair_amounts"]
			]
	move.text = "MOVE : " + mister_incredible.get_values().moves
	time.text = "TIME : " + mister_incredible.get_values().time
