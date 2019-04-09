extends TextureButton

onready var ghost_map = get_node("/root/main/ghost_map")

func _ready():
	pass

func _on_TextureButton_pressed():
	print("Clicked " + self.name)
	ghost_map.emit_signal("new_ghost_tower", self.name)
