extends KinematicBody2D

export var speed = 200
export var distance = 300

var path = PoolVector2Array()

func _process(delta):
	$RayCast2D.cast_to = PlayerStats.playerPos - self.global_position
	if $RayCast2D.is_colliding() == false:
		if sqrt(pow(PlayerStats.playerPos.x-self.global_position.x, 2)+pow(PlayerStats.playerPos.y-self.global_position.y, 2)) <= distance:
			pass
		else:
			move(delta)
	else:
		move(delta)

func move(delta):
	# Calculate the movement distance for this frame
	var distance_to_walk = speed * delta
	
	# Move the player along the path until he has run out of movement or the path ends.
	while distance_to_walk > 0 and path.size() > 0:
		var distance_to_next_point = position.distance_to(path[0])
		if distance_to_walk <= distance_to_next_point:
			# The player does not have enough movement left to get to the next point.
			position += position.direction_to(path[0]) * distance_to_walk
		else:
			# The player get to the next point
			position = path[0]
			path.remove(0)
		# Update the distance to walk
		distance_to_walk -= distance_to_next_point
