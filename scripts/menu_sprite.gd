extends TextureRect


var scale_rate = Vector2(0.1, 1.0)

func _ready():
	#refresh_texture()
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_callback(refresh_texture)
	tween.tween_property(self,"scale",Vector2(scale_rate.y, scale_rate.y),get_random_time())
	tween.tween_property(self,"rotation_degrees",get_random_degrees(),get_random_time())
	tween.tween_property(self,"rotation_degrees",get_random_degrees(),get_random_time())
	tween.tween_property(self,"scale",Vector2(scale_rate.x,scale_rate.x),get_random_time())
	#print("done")

func refresh_texture():
	texture = ImageManager.get_random_image().image_texture

func get_random_degrees():
	return randf_range(-360,360)

func get_random_time():
	return randf_range(1,2)
