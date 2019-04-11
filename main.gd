extends Node2D

var target = preload("res://target.tscn")
var Tower1 = preload("res://towers/Tower1.gd")

signal new_ghost_tower(type)

onready var start_pos = get_node("start_pos").get_position()
onready var end_pos = get_node("end_pos").get_position()
onready var nav = get_node("nav")
onready var map = get_node("nav/map")
onready var tower_map = get_node("tower_map")

func _ready():
	connect("new_ghost_tower", self, "_on_new_ghost_tower")
	
	
func _on_target_timer_timeout():
	var t = target.instance()
	add_child(t)
	t.set_position(start_pos)
	t.goal = end_pos
	t.nav = nav

func _on_new_ghost_tower(type):
	match type:
		"TOWER1":
			add_child(Tower1.new(true))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
