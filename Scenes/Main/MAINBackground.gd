extends ParallaxBackground

export(int) var cloud_speed
#export(int) var x_speed

onready var cloud: ParallaxLayer = get_node("Cloud")

func _physics_process(delta):
	cloud.motion_offset.x -= cloud_speed * delta
