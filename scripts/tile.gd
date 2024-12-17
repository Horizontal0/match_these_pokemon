extends TextureButton

@onready var image = $image
@onready var front = $front
@onready var audio = $AudioStreamPlayer2D

var image_name: String
var clickable = true

func _ready():
	SignalManager.on_tile_activate.connect(update_clickable)

func setup(image_data):
	image.texture = image_data["image_texture"]
	image_name = image_data["image_name"]

func update_scale(in_scale:float):
	print("run ",scale)
	scale = Vector2(in_scale,in_scale)
	print("afterrun ",scale)

func _on_pressed():
	if clickable:
		SignalManager.on_tile_clicked.emit(self)
		SoundManager.play_audio(audio, "SOUND_TILE")

func swap_face(open:bool):
	front.visible = !open
		
func update_clickable(status):
	clickable = status
