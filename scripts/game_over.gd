extends Control

@onready var timer = $Timer
@onready var exit = $exit

func _ready():
	SignalManager.on_game_over.connect(game_over_start)

func game_over_start():
	timer.start()
	show()

func _on_timer_timeout():
	exit.show()

func _process(delta):
	if exit.visible and Input.is_action_pressed("space"):
		GameManager.load_main_menu()


func _on_back_pressed():
	hide()
