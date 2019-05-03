extends "AttackTower.gd"


func _init().():
	cooldown = 0.5
	bullet_offset = Vector2(6,-55)
	Bullet = preload("res://bullets/Bullet1.tscn")
