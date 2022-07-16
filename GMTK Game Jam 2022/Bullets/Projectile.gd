extends KinematicBody2D

export var speed = 0
export var damage = 0

var target = Vector2()
var velocity = Vector2()
var timesRan = 0

func _ready():
	wait()

func _process(_delta):
	self.rotation = (self.global_position - target).angle()
	$Sprite.visible = true

func _physics_process(_delta):
	velocity = move_and_slide(velocity)

func wait():
	var time = 20
	var t = Timer.new()
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	self.queue_free()
