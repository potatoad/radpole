extends Node2D


func _physics_process(delta):
	var cam_pos = Global.camera.global_position
	set_position(cam_pos - (Global.projectResolution/2))
