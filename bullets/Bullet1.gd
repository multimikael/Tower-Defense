extends "Bullet.gd"

func _init().():
	speed = 100
	lifetime = 2000

func _on_BulletArea_area_entered(area):
	print(area.name)
	if area.name == "TargetArea":
		queue_free()
