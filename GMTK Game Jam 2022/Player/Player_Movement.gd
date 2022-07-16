extends KinematicBody2D

export var max_speed = 10
export var acceleration = 50
export var friction = 100

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _process(_delta):
	direction.x = int(Input.is_action_pressed("Move Right")) - int(Input.is_action_pressed("Move Left"))
	direction.y = int(Input.is_action_pressed("Move Down")) - int(Input.is_action_pressed("Move Up"))

func _physics_process(delta):
	direction = direction.normalized()
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * max_speed, delta * acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * friction)
	
	var collision = move_and_collide(velocity)
