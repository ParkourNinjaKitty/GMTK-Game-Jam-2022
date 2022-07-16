extends Sprite

export var projectileSpeed = 50
export var projectileDamage = 25
export (float) var fireRate = 5
export var gunLength = 30
export var projectileScene = "res://Bullets/Projectile1.tscn"

var canShoot = true

onready var projectile = load(projectileScene)

func _process(_delta):
	look_at(get_global_mouse_position())
	if sqrt(pow(self.global_rotation_degrees, 2)) >= 90:
		self.scale.y = -1
	else:
		self.scale.y = 1
	if Input.is_mouse_button_pressed(1):
		if canShoot == true:
			shoot()

func shoot():
	canShoot = false
	var projectileInstance = projectile.instance()
	projectileInstance.speed = projectileSpeed
	projectileInstance.global_position = Vector2(self.global_position.x+gunLength*cos(self.global_rotation), self.global_position.y+gunLength*sin(self.global_rotation))
	get_parent().get_parent().call_deferred("add_child", projectileInstance)
	wait()

func wait():
	var time = 1.0/fireRate
	var t = Timer.new()
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	canShoot = true
