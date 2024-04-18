extends Node2D


enum Recipient {
	GREEN,
	BLUE,
	PINK,
	YELLOW,
	WHITE,
}

@export var OFFSET := 15
@export var marker_sprite: Recipient = Recipient.GREEN:
	set (new_value):
		sprite.frame = new_value

@onready var sprite := $Sprite


func _ready():
	sprite.frame = marker_sprite


func _physics_process(_delta):
	var canvas := get_canvas_transform()
	var top_left := -canvas.origin / canvas.get_scale()
	var size := get_viewport_rect().size / canvas.get_scale()
	
	set_marker_position(Rect2(top_left, size))


func set_marker_position(bounds: Rect2):
	sprite.global_position.x = clamp(global_position.x, bounds.position.x + OFFSET, bounds.end.x - OFFSET)
	sprite.global_position.y = clamp(global_position.y, bounds.position.y + OFFSET, bounds.end.y - OFFSET)
	
	if bounds.has_point(global_position):
		hide()
	else:
		show()
