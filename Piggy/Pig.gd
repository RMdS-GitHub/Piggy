"""  
This script attached to the pig object is used to get input from
the player, and then move the pig thanks to function process.

It also manages the collisions with the apples.
"""

# Area2D is the parent with Sprite, Collision and AnimationPlayer.
extends Area2D

# Constant variable to be used within func _process, called by move(SPEED,SPEED)
# I removed the const I put export so the var is available in Inspector.
export(int) var SPEED = 50

# AnimationPlayer onready var for the pig.
onready var animationPlayer : AnimationPlayer = $AnimationPlayer

# Sprite onready var used to flip the direction of the pig when moving.
onready var sprite : Sprite = $Sprite

# Used in move() and _process() to set the animation Run to true or false.
var moving = false

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

When the input received is left the sprite of the pig flips to face the 
movement direction.

When the move() is called, moving == true so in this function the
the animation RUN is played. If moving == false the animation by default will be
Idle.
"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moving = false
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
		sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta)
		sprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
		
	if moving == true:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")
		
	"""
	This variable and function is to handle multiple collisions.
	It replaces the signal on area entered. It was just a way to show another
	way how to manage the collisions.
	"""
	#var areas = get_overlapping_areas()
	# Loop every element of the array and queue free the elements colliding.
	#for area in areas:
	#	area.queue_free()
	

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

It uses the variable moving wich is set to true when moving otherwise it's false
and the pig doesn't move. 
"""	
func move(xSpeed, ySpeed, delta):
	position.x += xSpeed * delta
	position.y += ySpeed * delta
	moving = true


"""
Function signal on pig for the collisions. When it collides with area, other 
than the pig it will delete it from the scene.
Once the pig touches an apple it will scale up.
If the color of the collision shape is white oon the world scene, it means that
it's disabled...it will not work.
"""
func _on_Pig_area_entered(area: Area2D) -> void:
	area.queue_free()
	scale *= 1.1
	
