extends Control

@export_file var current_level_scene: String
@export_file var main_menu_scene: String

@onready var menu_panel := $Background


func _on_pause_button_pressed():
	menu_panel.show()
	get_tree().paused = true


func _on_continue_pressed():
	menu_panel.hide()
	get_tree().paused = false


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(current_level_scene)
