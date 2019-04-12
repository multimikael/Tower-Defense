extends Node2D

onready var sprite = get_node("Bullet/sprite")
var start_pos setget set_start_pos, get_start_pos
var dir_vec setget set_dir_vec, get_dir_vec
var speed
var lifetime
var start_time

func _ready():
	start_time = OS.get_ticks_msec()

func _physics_process(delta):
	var motion = dir_vec * speed * delta
	translate(motion)
	if OS.get_ticks_msec() - start_time >= lifetime:
		queue_free()

func set_start_pos(pos):
	start_pos = pos
	
func get_start_pos():
	return start_pos

func set_dir_vec(vec):
	dir_vec = vec

func get_dir_vec():
	return dir_vec
	
