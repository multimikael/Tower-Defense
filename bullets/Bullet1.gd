extends "Bullet.gd"


func _init(start_pos, dir_vec).(start_pos, dir_vec):
	speed = 100
	var res = load("res://bullets/bullet1.png")
	sprite.texture = res
	lifetime = 2000

