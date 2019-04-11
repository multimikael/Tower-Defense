extends "Tower.gd"

func _init(isGhost).("TOWER1", isGhost):
	var res = load("res://towers/TOWER1.png")
	sprite.texture = res
	