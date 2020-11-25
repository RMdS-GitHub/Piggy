"""  
This script attached to the pig object is used to get input from
the player, and then move the pig thanks to function process.
"""

extends Area2D

# Constant variable to be used within func _process, called by move(SPEED,SPEED)
const SPEED = 4

"""
This function is used every frame. Gets input from the player and
then move the pig 4 px along the x or y axis.

is_action_pressed: means the action is being held down.
is_action_just_pressed: means action just barely pressed.
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0)
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0)
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED)
		

"""
This function is used within function process. You call it with the parameters
to move the pig Area2D along the x and y axis.
move(x, y) 
"""	
func move(xSpeed, ySpeed):
	position.x += xSpeed
	position.y += ySpeed
