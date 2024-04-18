extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}


func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(_on_child_transition)
			child.player = get_parent()
	
	if initial_state:
		current_state = initial_state
		current_state.enter()


func _process(delta):
	#print(current_state)
	if current_state:
		current_state.update(delta)


func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)


func _on_child_transition(state, new_state_name):
	if current_state != state:
		return

	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return

	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
