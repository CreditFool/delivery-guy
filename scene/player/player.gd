class_name Player
extends CharacterBody2D


@export var SPEED: float = 150.0
@export var JUMP_VELOCITY: float = -400.0

var package_recipient: int = -1
var direction: float = 0.0

@onready var sprite := $Sprite
@onready var animation_player := $AnimationPlayer
@onready var package := $Package
@onready var pickup_sound := $PickupSound


func _ready():
	#get_package()
	pass


func _process(_delta):
	#if Input.is_action_just_pressed("ui_accept"):
		#give_package()
		#get_package()
	pass


func _physics_process(_delta):
	move_and_slide()

	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		sprite.flip_h = (direction < 0)

	if is_on_floor():
		if velocity.x != 0:
			animation_player.play("Walk")
		else:
			animation_player.play("Idle")
	else:
		if velocity.y >= 0:
			animation_player.play("Jump")
		else:
			animation_player.play("Fall")


func have_package():
	return package_recipient != -1


func get_package():
	if not package_recipient != -1:
		package_recipient = randi_range(0, 3)

		package.visible = true
		package.get_node("RecipientFace").frame = package_recipient
		pickup_sound.play()


func give_package():
	package_recipient = -1
	package.visible = false

