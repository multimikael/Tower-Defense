extends Node2D

var target = preload("res://target.tscn")

onready var start_pos = get_node("start_pos").get_position()
onready var end_pos = get_node("end_pos").get_position()
onready var nav = get_node("nav")
onready var map = get_node("nav/map")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _on_target_timer_timeout():
	var t = target.instance()
	add_child(t)
	t.set_position(start_pos)
	t.goal = end_pos
	t.nav = nav
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
