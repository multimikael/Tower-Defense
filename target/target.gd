extends Node2D

var speed = 150
var nav = null setget set_nav
var path = []
var goal = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	
func set_nav(new_nav):
	nav = new_nav
	update_path()

func update_path():
	path = nav.get_simple_path(get_position(), goal, false)

func _physics_process(delta):
	#print(path)
	if path.size() > 1:
		var d = get_position().distance_to(path[0])
		if d > 2:
			set_position(get_position().linear_interpolate(path[0], (speed * delta)/d))
		else:
			path.remove(0)

func _on_TargetArea_area_entered(area):
	queue_free()
