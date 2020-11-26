"""  
This script attached to the pig object is used to get input from
the player, and then move the pig thanks to function process.
"""

extends Area2D

# Constant variable to be used within func _process, called by move(SPEED,SPEED)
# I removed the const I put export so the var is available in Inspector.
export(int) var SPEED = 50 

"""
This function is used every frame. Gets input from the player and
then move the pig 4 px along the x or y axis.

is_action_pressed: means the action is being held down.
is_action_just_pressed: means action just barely pressed.

We need to pass delta into the move function. If not debugger will tell us 
that delta is never used in the function. We need to specify delta in case 
the computer processor is overloaded. Delta the time since the previous 
frame, in real time can be different for us if the previous case happens.
Delta will track the time.
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta)
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
		

"""
move(x, y, delta).
This function is used within function process. You call it with the parameters
to move the pig Area2D along the x and y axis.

We need to pass delta into the move function. If not debugger will tell us 
that delta is never used in the function. Delta the time since the previous 
frame, in real time can be different for us if the previous case happens.
Delta will track the time. We need to specify delta in case 
the computer processor is overloaded.
The xSpeed and ySpeed need to be multiplied by delta. This compensates how fast 
our processor is calculating for our game.
"""	
func move(xSpeed, ySpeed, delta):
	position.x += xSpeed * delta
	position.y += ySpeed * delta
