extends TileMap

signal new_tower(type)

var towers = [] # Array for towers as dictonaries with fields: type, coord

func _ready():
	connect("new_tower", self, "_on_new_tower")

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var coord = world_to_map(event.global_position)
		print(_get_tower_by_coord(coord))

func _on_new_tower(type, coord):
	towers.append({ "type": type, "coord": coord })
	self.set_cell(coord.x, coord.y, get_tileset().find_tile_by_name(type))

func _get_tower_by_coord(coord):
	for t in towers:
		if t["coord"] == coord:
			return t
