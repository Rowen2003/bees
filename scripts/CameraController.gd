extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var lookPoint = %CameraLookPoint
	#look_at(lookPoint.global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
