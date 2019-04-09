extends TileMap

signal new_tower(type)

func _ready():
	connect("new_tower", self, "_on_new_tower")

func _on_new_tower(type, coord):
	self.set_cell(coord.x, coord.y, get_tileset().find_tile_by_name(type))

