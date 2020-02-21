extends KinematicBody2D

var speedTarget = 0.03

func _physics_process(delta):
	rotate(speedTarget)
	