extends Node

var sounds = {
	"SOUND_BG" : preload("res://assets/sounds/energetic-bgm-242515.mp3"),
	"SOUND_TILE" : preload("res://assets/sounds/experimental-8-bit-sound-270302.mp3"),
	"SOUND_WIN" : preload("res://assets/sounds/4570159504818176.wav"),
	"SOUND_MATCH" : preload("res://assets/sounds/shine-7-268909.mp3")
	}

func play_audio(player : AudioStreamPlayer2D, sound : String):
	if !sounds.has(sound):
		return
	player.stream = sounds[sound]
	player.play()
