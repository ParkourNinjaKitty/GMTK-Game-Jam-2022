extends KinematicBody2D

const BASE_SPEED = 10
const BASE_ACCELERATION = 50
const BASE_FRICTION = 100

export var speed = 10
export var acceleration = 50
export var friction = 100

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

onready var anim_tree = $AnimationTree["parameters/playback"]

func _ready():
	PlayerStats.playerPos = self.global_position

func _process(_delta):
	direction.x = int(Input.is_action_pressed("Move Right")) - int(Input.is_action_pressed("Move Left"))
	direction.y = int(Input.is_action_pressed("Move Down")) - int(Input.is_action_pressed("Move Up"))
	PlayerStats.playerPos = self.global_position
	if abs(velocity.x) + abs(velocity.y) > 0.1:
		anim_tree.travel("Run")
	else:
		anim_tree.travel("Idle")
	if velocity.x > 0:
		$Sprite.scale.x = 0.2
	if velocity.x < 0:
		$Sprite.scale.x = -0.2

func _physics_process(delta):
	direction = direction.normalized()
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * speed, delta * acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * friction)
	
	var collision = move_and_collide(velocity)
