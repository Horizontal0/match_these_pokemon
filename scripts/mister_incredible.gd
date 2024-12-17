extends Control

@onready var timer = $Timer
@onready var audio = $AudioStreamPlayer2D

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
	timer.start()

func _on_timer_timeout():
	for tiles in tiles_clicked:
		if tiles_clicked[0]["image_name"] == tiles_clicked[1]["image_name"]:
			SoundManager.play_audio(audio, "SOUND_MATCH")
			tiles.set_disabled(true)
		else:
			tiles.swap_face(false)
	tiles_clicked.clear()
	SignalManager.on_tile_activate.emit(true)
	print("close")
