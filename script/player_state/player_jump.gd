class_name PlayerJump
extends State


@export var player: CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func physics_update(delta):
	player.velocity.x = player.direction * player.SPEED
	player.velocity.y += gravity * delta

	if player.is_on_floor():
		transitioned.emit(self, "idle")
