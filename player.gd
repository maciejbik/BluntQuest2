extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1200.0
@onready var animation_player = $AnimationPlayer
@onready var ralsei = $Ralsei
var grav = Vector2(0,2500)
var flagJ = 0
var jumps=2


func _physics_process(delta):
	# Add the gravity.

	# Handle jump.
	if is_on_floor():
		jumps=2
	if Input.is_action_just_pressed("ui_up") and jumps>0:
		velocity.y = JUMP_VELOCITY
		jumps-=1;

	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation_player.play("running")
		if(direction>0):
			ralsei.flip_h=0
		else:
			ralsei.flip_h=1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("idle")
	if not is_on_floor():
		velocity += grav * delta
		animation_player.play("jump")
		if velocity.y>0:
			animation_player.play("fall")

	move_and_slide()


func _on_blunt_body_entered(body):
	pass # Replace with function body.
