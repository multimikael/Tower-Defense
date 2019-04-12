extends "Tower.gd"

func _init(is_ghost, pos).("TOWER1", is_ghost, pos):
	var res = load("res://towers/TOWER1.png")
	sprite.texture = res
	