extends Node

func resume_from_last():
	if get_tree().change_scene("res://levels/Level01.tscn") != OK:
		print_debug("Unable to load level")
	LoadingScreen.visible = false

func start_new_game():
	if get_tree().change_scene("res://levels/Level01.tscn") != OK:
		print_debug("Unable to load level")
	LoadingScreen.visible = false
