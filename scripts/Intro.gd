extends Control

func switch_to_menu():
	if get_tree().change_scene("res://ui/MainMenu.tscn") != OK:
		print_debug("Unable to load menu!")
