extends "Tower.gd"

var cooldown
var timer
var Bullet

func _ready():
	if !is_ghost:
		timer = Timer.new()
		timer.connect("timeout", self, "_on_timer_timeout")
		add_child(timer)
		timer.start(cooldown)
	
func _on_timer_timeout():
	# Find nearest target
	var targets = get_tree().get_nodes_in_group("targets")
	if targets.size() > 0:
		var near_pos = null
		for t in targets:
			if near_pos == null || global_position.distance_to(t.get_global_position()) < global_position.distance_to(near_pos):
				near_pos = t.get_global_position()
		var dir_vec = Vector2(near_pos.x - global_position.x, near_pos.y - global_position.y).normalized()
		var b = Bullet.instance()
		b.set_start_pos(global_position)
		b.set_dir_vec(dir_vec)
		add_child(b)
	