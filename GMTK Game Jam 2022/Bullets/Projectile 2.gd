extends "res://Bullets/Projectile.gd"

export var randomSpray = 75

func _ready():
	target = Vector2((PlayerStats.playerPos.x - get_global_mouse_position().x + self.global_position.x), (PlayerStats.playerPos.y - get_global_mouse_position().y + self.global_position.y))
	velocity = Vector2((self.global_position.x - target.x), (self.global_position.y - target.y))
	velocity = velocity.normalized() * speed + Vector2(rand_range(-randomSpray, randomSpray), rand_range(-randomSpray, randomSpray))
	velocity = velocity.normalized() * speed
	

func _on_CollisionArea_area_entered(_area):
	queue_free()
