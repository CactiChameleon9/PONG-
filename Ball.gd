extends KinematicBody2D

export var inital_speed : float = 400.0
export var speed_increase : float = 40.0

var speed : float = inital_speed


var velocity : Vector2 = Vector2.RIGHT



func _draw():
	draw_circle(Vector2(0, 0), 20, Color("#c4c4c4"))


func _physics_process(delta):
	velocity = velocity.normalized() * speed
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		speed += speed_increase
		
		if collision.collider.is_in_group("Paddle"):
			velocity.x += velocity.x/abs(velocity.x) * speed_increase
			
			collision_mask = 2
			$DisableCollision.start()


func reset_speed():
	speed = inital_speed


func _on_DisableCollision_timeout():
	collision_mask = 3
