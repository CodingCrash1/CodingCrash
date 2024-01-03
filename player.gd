extends CharacterBody2D

# var vvelocity = Vector2(0,0)
var gravity = 50
var max_fall_speed =  50

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -100
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 100
	else:
		velocity.x = 0
	
	move_and_slide()

	for i in get_slide_collision_count() :
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * 80)
