extends Control

var next_scene = preload("res://SelectionScreen.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	var game_state = get_node("/root/gamestate")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene_to(next_scene)
