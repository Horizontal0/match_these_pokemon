extends Node

var level_selected : int

const levelK = {
	1: {"rows":2, "cols":4},
	2: {"rows":4, "cols":4},
	3: {"rows":6, "cols":6},
	4: {"rows":8, "cols":8},
	5: {"rows":10, "cols":10},
	6: {"rows":12, "cols":12},
	7: {"rows":16, "cols": 16},
	8: {"rows":30, "cols": 30}
}

func get_level_selection():
	var level_data = levelK[level_selected]
	var cols_nums = level_data["cols"]
	var pair_amounts = level_data["rows"] * level_data["cols"] /2
	var selected_images = []
	ImageManager.shuffle_image()
	for image in range(pair_amounts):
		selected_images.append(ImageManager.image_list[image])
		selected_images.append(ImageManager.image_list[image])
	selected_images.shuffle()
	return {
		"pair_amounts": pair_amounts,
		"cols_nums": cols_nums,
		"image_list": selected_images
	}

func save_level_selection(level):
	level_selected = level
