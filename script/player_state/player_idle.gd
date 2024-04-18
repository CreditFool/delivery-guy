class_name PlayerIdle
extends State


@export var player: CharacterBody2D


func enter():
	#print("hello")
	player.velocity.x = 0.0


func update(_delta):
	if player.direction:
		transitioned.emit(self, "walk")
		
	if not player.is_on_floor():
		transitioned.emit(self, "jump")


func physics_update(_delta):
	if Input.is_action_just_pressed("ui_up"):
		player.velocity.y = player.JUMP_VELOCITY
