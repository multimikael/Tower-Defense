extends TileMap

signal new_ghost_tower(type)

var ghost_type
var show_ghost = false
var isTowerPlaceable = false

const FORBIDDEN_TILE_INDEX = 1

onready var _tileset = self.get_tileset()
onready var map = get_node("/root/main/nav/map")
onready var tower_map = get_node("/root/main/tower_map")

func _ready():
	connect("new_ghost_tower", self, "_on_new_ghost_tower")

func _input(event):
	if show_ghost:
		if event is InputEventMouseMotion:
			var coord = world_to_map(event.global_position)
			self.clear()
			var map_tile = map.get_cell(coord.x, coord.y)
			var tower_tile = tower_map.get_cell(coord.x, coord.y)
			if map_tile != FORBIDDEN_TILE_INDEX and tower_tile == -1:
				self.set_cell(coord.x, coord.y, _tileset.find_tile_by_name(ghost_type))
				isTowerPlaceable = true
			else:
				isTowerPlaceable = false

		elif event is InputEventMouseButton:
			var coord = world_to_map(event.global_position)
			if event.button_index == BUTTON_LEFT:
				if isTowerPlaceable and show_ghost:
					tower_map.emit_signal("new_tower", ghost_type, coord)
					isTowerPlaceable = false
					show_ghost = false
			elif event.button_index == BUTTON_RIGHT:
				self.clear()
				show_ghost = false


func _on_new_ghost_tower(type):
	print(type)
	ghost_type = type
	show_ghost = true

