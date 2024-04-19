extends Node2D


@export_file var level_scene: String = "res://scene/level/level.tscn"

@onready var score_label := $CanvasLayer/Control/VBoxContainer/Score


func _ready():
	SavedData.load_data()
	update_highscore_label()


func update_highscore_label():
	score_label.text = str(SavedData.current_highscore)


func _on_play_button_pressed():
	get_tree().change_scene_to_file(level_scene)
