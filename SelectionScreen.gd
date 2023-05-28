extends Control

var next_scene = preload("res://ConnectionScene.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	$Label.text = "Elon Musk selected"
	$"/root/gamestate".player_ty = "Elon"
	pass # Replace with function body.


func _on_Button3_pressed():
	$Label.text = "Wizard selected"
	$"/root/gamestate".player_ty = "Wizard"	
	pass # Replace with function body.


func _on_Button4_pressed():
	$Label.text = "Knight selected"
	$"/root/gamestate".player_ty = "Knight"	
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene_to(next_scene)
	pass # Replace with function body.
