extends Sprite

export var damage = 50
export (float) var attackRate = 1

export onready var animationPlayer = $"AnimationPlayer"

var canAttack = true

func _process(_delta):
	look_at(get_global_mouse_position())
	if sqrt(pow(self.global_rotation_degrees, 2)) >= 90:
		self.scale.y = -1
	else:
		self.scale.y = 1
	if Input.is_mouse_button_pressed(1):
		if canAttack == true:
			attack()

func attack():
	canAttack = false
	animationPlayer.play("Attack")
	wait()

func wait():
	var time = 1.0/attackRate
	var t = Timer.new()
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	canAttack = true
