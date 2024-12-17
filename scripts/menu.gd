extends Control

@onready var h_box_container = $VBoxContainer/HBoxContainer
@onready var audio = $AudioStreamPlayer2D

var level_button = preload("res://scenes/level_button.tscn")

func _ready():
	SoundManager.play_audio(audio, "SOUND_BG")
	for levels in  GameManager.levelK:
		var level_button_instance = level_button.instantiate()
		h_box_container.add_child(level_button_instance)
		level_button_instance.update_label(levels)
		
