extends Control

var next_scene = preload("res://ConnectionScene.tscn")

enum PLAYER_SELECTION{
	PLAYER_1,
	PLAYER_2,
}

var player_selection = null

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
	$Label.text = "Player 1 selected"
	player_selection = PLAYER_SELECTION.PLAYER_1
	pass # Replace with function body.


func _on_Button3_pressed():
	$Label.text = "Player 2 selected"
	player_selection = PLAYER_SELECTION.PLAYER_2
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene_to(next_scene)
	pass # Replace with function body.
