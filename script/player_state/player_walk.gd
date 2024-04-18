extends State


@export var player: CharacterBody2D
var direction: Vector2 = Vector2.ZERO


func physics_update(_delta):
	player.velocity.x = player.direction * player.SPEED

	if Input.is_action_just_pressed("ui_up"):
		player.velocity.y = player.JUMP_VELOCITY

	if not player.is_on_floor():
		transitioned.emit(self, "jump")
