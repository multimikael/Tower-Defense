extends Node2D

const FORBIDDEN_TILE = 1

var type setget set_type, get_type
var is_ghost setget set_is_ghost, get_is_ghost
var sprite

onready var main = get_node("/root/main")
onready var map = get_node("/root/main/nav/map")

func _init():
	pass

func _input(event):
	if is_ghost:
		if event is InputEventMouseMotion:
			self.set_position(event.global_position)
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT:
				var coord = map.world_to_map(event.global_position)
				var tile = map.get_cell(coord.x, coord.y)
				print(tile)
				if tile != FORBIDDEN_TILE:
					main.emit_signal("new_tower", self.type, false, event.global_position)
					self.queue_free()
			elif event.button_index == BUTTON_RIGHT:
				self.queue_free()

func set_type(t):
	type = t

func get_type():
	return type

func set_is_ghost(b):
	is_ghost = b

func get_is_ghost():
	return is_ghost