extends Node2D


@onready var countdown := $CanvasLayer/LevelUI/Countdown
@onready var game_over_screen := $CanvasLayer/LevelUI/GameOverScreen
@onready var tutorial_screen := $CanvasLayer/LevelUI/TutorialScreen

var correct_package := 0
var false_package := 0


func _ready():
	var tween := create_tween()
	tween.tween_property($ParallaxBackground/ParallaxLayer, "modulate", Color(1.0, 1.0, 0.5), countdown.wait_time)

	tutorial_screen.open_tutorial_screen()


func _on_recipient_package_received(correct):
	if correct:
		correct_package += 1
	else:
		false_package += 1


func _on_countdown_countdown_finish():
	game_over_screen.show_game_over_panel(correct_package, false_package)
