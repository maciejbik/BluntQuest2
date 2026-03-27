extends Area2D
var speed=400
signal blunt_level
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y+=speed*delta
	pass


func _on_body_entered(body):
	blunt_level.emit()
	queue_free()
	
	pass # Replace with function body.
