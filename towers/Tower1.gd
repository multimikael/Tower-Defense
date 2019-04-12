extends "Tower.gd"

const COOLDOWN = 0.5

var timer

func _init(is_ghost, pos).("TOWER1", is_ghost, pos):
	var res = load("res://towers/TOWER1.png")
	sprite.texture = res
	if !is_ghost:
		timer = Timer.new()
		timer.connect("timeout", self, "_on_timer_timeout")
		add_child(timer)
		timer.start(COOLDOWN)
	
func _on_timer_timeout():
	print("timeout")
	