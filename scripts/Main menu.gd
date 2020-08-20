extends Control

enum buttons{CONTINUE, NEW_GAME, HELP, OPTIONS, EXIT}
var current_button = buttons.CONTINUE
var button_textures = {
	"continue" : [
		preload("res://images/menu/continue.png"),
		preload("res://images/menu/continue_hover.png")],
	"newgame" : [
		preload("res://images/menu/new_game.png"),
		preload("res://images/menu/new_game_hover.png")],
	"help" : [
		preload("res://images/menu/help.png"),
		preload("res://images/menu/help_hover.png")],
	"options" : [
		preload("res://images/menu/options.png"),
		preload("res://images/menu/options_hover.png")],
	"exit" : [
		preload("res://images/menu/exit.png"),
		preload("res://images/menu/exit_hover.png")]}

func change_button_look(button):
	match button:
		buttons.CONTINUE:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Continue.texture = button_textures["continue"][1]
		buttons.NEW_GAME:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/NewGame.texture = button_textures["newgame"][1]
		buttons.HELP:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Help.texture = button_textures["help"][1]
		buttons.OPTIONS:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Options.texture = button_textures["options"][1]
		buttons.EXIT:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Exit.texture = button_textures["exit"][1]
		_:
			return

	if button != buttons.CONTINUE:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Continue.texture = button_textures["continue"][0]
	if button != buttons.NEW_GAME:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/NewGame.texture = button_textures["newgame"][0]
	if button != buttons.HELP:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Help.texture = button_textures["help"][0]
	if button != buttons.OPTIONS:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Options.texture = button_textures["options"][0]
	if button != buttons.EXIT:
			$MarginContainer/HBoxContainer/MenuBtn/VBoxContainer/Exit.texture = button_textures["exit"][0]
				

func _input(event):
	if event.is_action_pressed("ui_up"):
		if current_button > buttons.CONTINUE:
			current_button -= 1
			$Selection.play()
			change_button_look(current_button)
	if event.is_action_pressed("ui_down"):
		if current_button < buttons.EXIT:
			current_button += 1
			$Selection.play()
			change_button_look(current_button)
	if event.is_action_pressed("attack"):
		if current_button == buttons.CONTINUE:
			LoadingScreen.visible = true
			game_manager.resume_from_last()
		if current_button == buttons.NEW_GAME:
			LoadingScreen.visible = true
			game_manager.start_new_game()
		if current_button == buttons.EXIT:
			get_tree().quit()
			$ConfirmSelection.play()
