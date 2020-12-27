extends Camera
class_name FollowCam

export var offset_distance:Vector3 = Vector3(0, 5, 10)
export var offset_rotation:Vector3 = Vector3(-10, 0, 0)
onready var target setget set_target, get_target



func set_target(t):
	target = t



func get_target():
	return target


func _process(delta):
	if target == null:
		find_target()
		return
	
	translation = target.translation + offset_distance


func find_target():
	target = get_parent().get_node("PlayerRB")
	
