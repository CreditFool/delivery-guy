extends Node2D


@onready var input_prompt := $InputPrompt

var player: Player


func _input(event):
	if event.is_action_pressed("ui_accept") and player != null:
		if not player.have_package():
			player.get_package()
			input_prompt.hide()


func _on_interaction_area_body_entered(body):
	if body is Player:
		player = body
		if not player.have_package():
			input_prompt.show()


func _on_interaction_area_body_exited(body):
	if body is Player:
		player = null
		input_prompt.hide()
