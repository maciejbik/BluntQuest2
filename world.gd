extends Node2D

@onready var hearts = $Hearts
var player = preload("res://player.tscn")
var blunt = preload("res://blunt.tscn")
@onready var bluntlevel = $bluntlevel
@onready var endscreen = $ENDSCREEN
@onready var winscreen = $WINSCREEN
@onready var respa = $Resp

var blunt_level=0
var lives=3
var game_over=0
var hardcore =0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func remove_life():
	hearts.get_children()[lives-1].visible=0
	lives-=1;
	if(lives==0):
		game_over=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(hardcore)
	if Input.is_action_just_pressed("ui_reset"):
		
		bluntlevel.label_settings.set_font_color(Color.WHITE) 
		get_tree().reload_current_scene()
		
	pass


func _on_bullet_uderzono():
	print("holy giat")
	remove_life()
	await get_tree().create_timer(3).timeout
	if game_over==0:
		var p = player.instantiate()
		add_child(p)
		p.position=Vector2(500,0)
	else:
		endscreen.visible=true
		bluntlevel.text="PDW. Wciśnij: R żeby reset"
		bluntlevel.label_settings.set_font_color(Color.BLACK) 



func _on_blunt_blunt_level():
	blunt_level+=5
	respa.wait_time-=0.1
	if (blunt_level>=100):
		winscreen.visible=true
	
	print(blunt_level)
	bluntlevel.text = "BLUNT LEVEL: "+str(blunt_level)+"%"
	pass # Replace with function body.


func _on_timer_timeout():
	var b = blunt.instantiate()
	add_child(b)
	b.connect("blunt_level",self._on_blunt_blunt_level)
	b.position=Vector2(randi()%1000,0)
