extends Node2D
#  Menu music Sound

func _ready():
	pass


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
