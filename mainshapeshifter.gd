extends KinematicBody2D

var currentCharacter = null
var character1 = preload("res://actualwizard.tscn")
var character2 = preload("res://FireWizard.tscn")
var character3 = preload("res://witch.tscn")

var playerPosition = Vector3.ZERO

func _ready():
	playerPosition = global_transform.origin

func _input(event):
	if is_network_master():
		if event.is_action_pressed("shape_shift_1"):
			rpc("switch_character", "res://actualwizard.tscn")
			switch_character("res://actualwizard.tscn")
		elif event.is_action_pressed("shape_shift_2"):
			rpc("switch_character", "res://FireWizard.tscn")
			switch_character("res://FireWizard.tscn")
		elif event.is_action_pressed("shape_shift_3"):
			rpc("switch_character", "res://witch.tscn")
			switch_character("res://witch.tscn")
	
puppet func switch_character(newCharacter):
	if currentCharacter:
		playerPosition = to_local(currentCharacter.global_transform.origin)
		currentCharacter.queue_free()

	currentCharacter = load(newCharacter).instance()
	add_child(currentCharacter)

	currentCharacter.global_transform.origin = to_global(playerPosition)
