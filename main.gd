extends Node2D

var target = preload("res://target/target.tscn")
var Tower1 = preload("res://towers/Tower1.tscn")

signal new_tower(type, is_ghost, pos)

onready var start_pos = get_node("start_pos").get_position()
onready var end_pos = get_node("end_pos").get_position()
onready var nav = get_node("nav")
onready var map = get_node("nav/map")

func _ready():
	connect("new_ghost_tower", self, "_on_new_ghost_tower")
	connect("new_tower", self, "_on_new_tower")
	
func _on_target_timer_timeout():
	var t = target.instance()
	t.add_to_group("targets")
	add_child(t)
	t.set_position(start_pos)
	t.goal = end_pos
	t.nav = nav

func _on_new_tower(type, is_ghost, pos):
	match type:
		"TOWER1":
			var t = Tower1.instance()
			t.set_is_ghost(is_ghost)
			t.set_type(type)
			t.set_position(pos)
			t.add_to_group("towers")
			add_child(t)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
