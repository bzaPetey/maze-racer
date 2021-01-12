extends KinematicBody


export var speed:float = 10
var velocity:Vector3



func _ready():
	pass


func _process(delta):
	get_input()



func _physics_process(delta):
	var norm = velocity.normalized() * speed

	rotate_x(deg2rad(norm.z))
	rotate_z(deg2rad(-norm.x))
	move_and_slide(norm)



func get_input():
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	velocity.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
