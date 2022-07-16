extends Control

func _on_Start_Button_pressed():
	get_tree().change_scene("link to scene you want to travel to")
	get_tree().quit()
