# have the player control the camera instead of the camera following the player
# the input is on the player, and thus easier to rotate the camera throguh
#the player

extends RigidBody
class_name Player

export var speed:float = .05

#this is going to rotate with the player. Needs to point down all the time
onready var touching_floor:RayCast = $RayCast
var velocity:Vector3




func _physics_process(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.z = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up") 
	
	apply_central_impulse(velocity.normalized() * speed)
	
	if Input.is_action_just_released("ui_select") && touching_floor.is_colliding():
		apply_central_impulse(Vector3.UP * 5)
		
	
