extends Label


signal countdown_finish

@export var wait_time: int = 60

@onready var countdown_timer := $CountdownTimer
@onready var label_updater := $LabelUpdater


func _ready():
	countdown_timer.wait_time = wait_time
	text = str(countdown_timer.wait_time)
	countdown_timer.start()


func update_label():
	text = str(int(countdown_timer.time_left))


func _on_label_updater_timeout():
	update_label()


func _on_timeout():
	label_updater.stop()
	update_label()


func _on_countdown_timer_timeout():
	countdown_finish.emit()
