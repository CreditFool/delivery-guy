extends CharacterBody2D


func _ready():
	velocity = Vector2(50, 0)


func _physics_process(_delta):
	move_and_slide()
