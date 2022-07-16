extends Node2D

func _process(delta):
	var path = $Navigation2D.get_simple_path($Enemy.position, PlayerStats.playerPos)
	$Enemy.path = path
