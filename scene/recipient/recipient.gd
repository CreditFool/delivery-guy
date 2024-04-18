extends Sprite2D


signal package_received(correct)

enum Recipient {
	GREEN,
	BLUE,
	PINK,
	YELLOW,
	WHITE,
}

@export var recipient: Recipient = Recipient.GREEN

@onready var animation_player := $AnimationPlayer
@onready var emote_player := $EmotePlayer
@onready var off_screen_marker := $OffScreenMarker
@onready var input_prompt := $InputPrompt
@onready var correct_package_sound := $CorrectPackageSound
@onready var false_package_sound := $FalsePackageSound
@onready var particle := $Particle

var player: Player

var recipient_sprite := {
	Recipient.GREEN: 0,
	Recipient.BLUE: 11,
	Recipient.PINK: 22,
	Recipient.YELLOW: 33,
	Recipient.WHITE: 44,
}


var recipient_wave_animation := {
	Recipient.GREEN: "GreenWave",
	Recipient.BLUE: "BlueWave",
	Recipient.PINK: "PinkWave",
	Recipient.YELLOW: "YellowWave",
	Recipient.WHITE: "WhiteWave",
}


func _ready():
	frame = recipient_sprite[recipient]
	off_screen_marker.marker_sprite = recipient
	input_prompt.hide()


func _input(event):
	if event.is_action_pressed("ui_accept") and player != null:
		if player.have_package():
			take_package()
			input_prompt.hide()


func take_package():
	if player.package_recipient == recipient:
		emote_player.play("Happy")
		correct_package_sound.play()
		particle.emitting = true
	else:
		emote_player.play("Angry")
		false_package_sound.play()
	
	package_received.emit((player.package_recipient == recipient))
	player.give_package()


func _on_visible_on_screen_notifier_2d_screen_entered():
	var camera_pos = get_viewport().get_camera_2d().global_position
	flip_h = (camera_pos.x - global_position.x) < 0
	animation_player.play(recipient_wave_animation[recipient])
	emote_player.play("Exclamation")


func _on_interaction_area_body_entered(body):
	if body is Player:
		player = body
		if player.have_package():
			input_prompt.show()


func _on_interaction_area_body_exited(body):
	if body is Player:
		player = null
		input_prompt.hide()
