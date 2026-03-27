extends Node

@onready var resp = $"../Resp"
@onready var places = $"."
@onready var respa = preload("res://bullet.tscn")
var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_resp_timeout():
	var r = respa.instantiate()
	var world = get_tree().get_root().get_node("World")
	world.add_child(r)
	var random = randi()%6
	r.position = places.get_children()[random].position
	r.connect("uderzono",world._on_bullet_uderzono)
	if(random>2):
		r.linear_velocity.x=-speed
		r.get_children()[0].flip_h=true
	else:
		r.linear_velocity.x=speed
