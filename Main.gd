extends Node2D

const ball := preload("res://Ball.tscn")

onready var ball_position : Vector2 = $"%Ball".position


func reset_ball():
	yield(get_tree().create_timer(.5), "timeout")
	
	$"%Ball".reset_speed()
	$"%Ball".position = ball_position

