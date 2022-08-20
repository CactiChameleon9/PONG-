extends KinematicBody2D

export var is_player : bool = false
export var acceleration : float = 50.0
export var friction : float = 55.0
export var speed : float = 500.0

var velocity : Vector2 = Vector2.ZERO

onready var inital_x = position.x


func _physics_process(_delta):

	var direction := Vector2.ZERO

	if is_player:
		direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	else:
		if get_node_or_null("%Ball"):
			direction.y = 1 if $"%Ball".position.y >= self.position.y else -1
		else:
			direction.y = 0
	
	velocity += acceleration * direction
	if direction.y == 0:
		velocity -= velocity.normalized() * friction
		if abs(velocity.length()) <= friction:
			velocity = Vector2.ZERO
	
	velocity = velocity.limit_length(speed)
	
	velocity = move_and_slide(velocity)
	
	position.x = inital_x
