extends "Tower.gd"

var cooldown
var timer
var Bullet

func _init(type, is_ghost, pos).(type, is_ghost, pos):
	pass

func _ready():
	if !is_ghost:
		timer = Timer.new()
		timer.connect("timeout", self, "_on_timer_timeout")
		add_child(timer)
		timer.start(cooldown)
	
func _on_timer_timeout():
	# Find nearest target
	var targets = main.get_targets()
	if targets.size() > 0:
		var near_pos = null
		for t in targets:
			if near_pos == null || global_position.distance_to(t.get_global_position()) < global_position.distance_to(near_pos):
				near_pos = t.get_global_position()
		var dir_vec = Vector2(near_pos.x - global_position.x, near_pos.y - global_position.y).normalized()
		add_child(Bullet.new(global_position, dir_vec))
	