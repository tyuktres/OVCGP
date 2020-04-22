extends KinematicBody2D

export var speed = 250

func _ready():
	pass

func _physics_process(delta):
	var dir = Vector2(0,0)
	if (Input.is_action_pressed("up")):
		dir += Vector2(0,-1)
	if (Input.is_action_pressed("down")):
		dir += Vector2(0,1)
	if (Input.is_action_pressed("left")):
		dir += Vector2(-1,0)
	if (Input.is_action_pressed("right")):
		dir += Vector2(1,0)
	if (dir != Vector2(0,0)):
		dir = dir.normalized()*speed

	if (Input.is_action_just_pressed("fire")):
		shoot()

	move_and_slide(dir)
	look_at(get_global_mouse_position())
	pass

func shoot():
	var sceneInstance = load("res://Bullet.tscn").instance()
	sceneInstance.position = position
	get_parent().add_child(sceneInstance)




