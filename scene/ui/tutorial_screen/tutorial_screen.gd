extends Control


@onready var tutorial_1 := $Background/BasePanel/Panel/Tutorial1
@onready var tutorial_2 := $Background/BasePanel/Panel/Tutorial2
@onready var tutorial_3 := $Background/BasePanel/Panel/Tutorial3

@onready var next_button_label := $Background/BasePanel/Panel/Next/Label

@onready var tutorial_dict := {
	0: tutorial_1,
	1: tutorial_2,
	2: tutorial_3,
}

var current_index := 0


func _ready():
	hide()


func open_tutorial_screen():
	get_tree().paused = true
	show()
	show_tutorial()


func close_tutorial_screen():
	get_tree().paused = false
	hide()


func show_tutorial():
	for key in tutorial_dict:
		if key == current_index:
			tutorial_dict[key].show()
		else:
			tutorial_dict[key].hide()


func _on_back_pressed():
	if current_index == 0:
		return
	
	current_index -= 1
	if current_index != 2:
		next_button_label.text = "Next"

	show_tutorial()


func _on_next_pressed():
	if current_index == 2:
		close_tutorial_screen()
		return
	
	current_index += 1
	if current_index == 2:
		next_button_label.text = "Close"

	show_tutorial()
