extends TextureButton

onready var main = get_node("/root/main")

func _ready():
	pass

func _on_TextureButton_pressed():
	print("Clicked " + self.name)
	main.emit_signal("new_ghost_tower", self.name)
