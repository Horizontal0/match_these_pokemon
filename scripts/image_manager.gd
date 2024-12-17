extends Node

var image_list = []

func _ready():
	load_image_from_source()

func load_image_from_source():
	var path = "res://assets/sprites/"
	var dir = DirAccess.open(path)
	for image in dir.get_files():
		if not ".import" in image:
			#create temp dictionary
			var temp_list = {
				"image_name" : image.rstrip(".png"),
				"image_texture" : load(path + image)
			}
			image_list.append(temp_list)
	#print(image_list)

func get_random_image() -> Dictionary:
	return image_list.pick_random()

func shuffle_image() -> void:
	image_list.shuffle()
