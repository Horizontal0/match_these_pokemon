extends Node

var sounds = {
	"SOUND_BG" : preload("res://assets/sounds/energetic-bgm-242515.mp3"),
	"SOUND_TILE" : preload("res://assets/sounds/sound.mp3"),
	"SOUND_WIN" : preload("res://assets/sounds/4570159504818176.wav"),
	"SOUND_MATCH" : preload("res://assets/sounds/shine.mp3")
	}

func play_audio(player : AudioStreamPlayer2D, sound : String):
	if !sounds.has(sound):
		return
	player.stream = sounds[sound]
	player.play()
