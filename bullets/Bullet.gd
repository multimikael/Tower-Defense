extends Node2D

var sprite
var start_pos
var dir_vec
var speed
var lifetime
var start_time

func _init(start_pos, dir_vec):
	self.start_pos = start_pos
	self.dir_vec = dir_vec
	self.sprite = Sprite.new()
	add_child(sprite)

func _ready():
	start_time = OS.get_ticks_msec()

func _physics_process(delta):
	var motion = dir_vec * speed * delta
	translate(motion)
	if OS.get_ticks_msec() - start_time >= lifetime:
		queue_free()
	
