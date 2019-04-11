extends Node2D

var type
var timer
var isGhost
var sprite

func _init(type, isGhost):
	self.type = type
	self.isGhost = isGhost
	self.sprite = Sprite.new()
	add_child(sprite)

func _input(event):
	if isGhost:
		if event is InputEventMouseMotion:
			self.set_position(event.global_position)