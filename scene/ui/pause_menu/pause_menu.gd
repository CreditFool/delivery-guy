extends Control

@export_file var current_level_scene: String
@export_file var main_menu_scene: String = "res://scene/main_menu/main_menu.tscn"

@onready var menu_panel := $Background
@onready var pause_button := $PauseButton


func _ready():
	menu_panel.hide()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		pause_button.pressed.emit()


func _on_pause_button_pressed():
	menu_panel.show()
	get_tree().paused = true


func _on_continue_pressed():
	menu_panel.hide()
	get_tree().paused = false


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(current_level_scene)


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(main_menu_scene)
