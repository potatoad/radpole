extends Control

var game = preload("res://Arena/Arena.tscn")



func _on_New_game_button_pressed():
	get_tree().change_scene("res://Arena/Arena.tscn")


func _on_Exit_button_pressed():
	get_tree().quit()
