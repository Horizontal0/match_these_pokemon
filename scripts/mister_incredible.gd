extends Control

@onready var timer = $Timer
@onready var audio = $AudioStreamPlayer2D
@onready var game_timer = $game_timer


var pairs_done : int
var time : int
var moves : int
var tiles_clicked = []

func _ready():
	SignalManager.on_tile_clicked.connect(tile_clickity)

func tile_clickity(tile):
	tile.swap_face(true)
	if tiles_clicked.size() < 1 or tile != tiles_clicked[0]:
		tiles_clicked.append(tile)
	if tiles_clicked.size() == 1:
		return
	SignalManager.on_tile_activate.emit(false)
	moves += 1
	timer.start()

func _process(delta):
	get_values()

func _on_timer_timeout():
	for tiles in tiles_clicked:
		if tiles_clicked[0]["image_name"] == tiles_clicked[1]["image_name"]:
			SoundManager.play_audio(audio, "SOUND_MATCH")
			pairs_done += 1
			tiles.set_disabled(true)
		else:
			tiles.swap_face(false)
	tiles_clicked.clear()
	SignalManager.on_tile_activate.emit(true)
	print("close")

func _on_game_timer_timeout():
	time += 1

func get_values():
	var minute = int(time/60)
	var second = time % 60
	
	return {
		"pairs_done" :str(pairs_done),
		"moves" : str(moves),
		"time" :	"%02d:%02d" %[minute,second]
		}
