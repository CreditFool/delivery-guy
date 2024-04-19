extends Node


const SAVE_GAME_PATH := "user://savegame.dat"

var current_highscore := 0


func save():
	var save_dict := {
		"highscore": current_highscore,
	}
	return save_dict


func write_data():
	var save_game = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)
	var json_string := JSON.stringify(save())

	save_game.store_line(json_string)
	save_game.close()

func load_data():
	if not FileAccess.file_exists(SAVE_GAME_PATH):
		return
	
	var save_game = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
	var game_data: Dictionary
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		json.parse(json_string)
		game_data = json.get_data()
		
	current_highscore = game_data["highscore"]
	save_game.close()
