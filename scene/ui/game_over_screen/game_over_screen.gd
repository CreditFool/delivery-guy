extends Control


@export_file var current_level_scene: String
@export_file var main_menu_scene: String

@onready var game_over_panel := $Background

@onready var num_of_correct := $Background/BasePanel/Panel/VBoxContainer/HBoxContainer/NumOfCorrect
@onready var total_correct := $Background/BasePanel/Panel/VBoxContainer/HBoxContainer/TotalCorrect
@onready var num_of_false := $Background/BasePanel/Panel/VBoxContainer/HBoxContainer2/NumOfFalse
@onready var total_false := $Background/BasePanel/Panel/VBoxContainer/HBoxContainer2/TotalFalse
@onready var final_score := $Background/BasePanel/Panel/VBoxContainer/HBoxContainer3/FinalScore
@onready var is_new_highscore := $Background/BasePanel/Panel/VBoxContainer/IsNewHighscore


func _ready():
	game_over_panel.hide()


func show_game_over_panel(correct_delivery: int, false_delivery: int):
	var correct_score := correct_delivery * 100
	var false_score := false_delivery * -50
	var total_score := correct_score + false_score

	num_of_correct.text = str(correct_delivery) + "* 100"
	total_correct.text = "+" + str(correct_score)
	num_of_false.text = str(false_delivery) + "* -50"
	total_false.text = "-" + str(false_score)
	final_score.text = str(total_score)

	if (total_score > SavedData.current_highscore):
		is_new_highscore.show()
		SavedData.current_highscore = total_score
	else:
		is_new_highscore.hide()

	get_tree().paused = true
	game_over_panel.show()


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(current_level_scene)
