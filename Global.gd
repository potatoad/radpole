extends Node

var node_creation_parent = null
var player = null
var camera = null

var projectResolution = Vector2(ProjectSettings.get_setting("display/window/size/width"),ProjectSettings.get_setting("display/window/size/height"))

var points = 0
var highscore = 0

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


func save():
	var save_dic = {
		"highscore": highscore
	}
	return save_dic
	
func save_game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass("user://savegame.save", File.WRITE, "enc")
	save_game.store_line(to_json(save()))
	save_game.close()
	print("File saved to disk")
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		print("No save file to load")
		return
	
	save_game.open_encrypted_with_pass("user://savegame.save", File.READ, "enc")
	print("File read from disk")
	
	var current_line = parse_json(save_game.get_line())
	
	highscore = current_line["highscore"]
	
	save_game.close()
	
