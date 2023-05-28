extends KinematicBody2D

var currentCharacter = null
var character1 = preload("res://actualwizard.tscn")
var character2 = preload("res://FireWizard.tscn")
var character3 = preload("res://witch.tscn")

var playerPosition = Vector3.ZERO

func _ready():
	playerPosition = global_transform.origin

func _input(event):
	if event.is_action_pressed("shape_shift_1"):
		switch_character(character1)
	elif event.is_action_pressed("shape_shift_2"):
		switch_character(character2)
	elif event.is_action_pressed("shape_shift_3"):
		switch_character(character3)

func switch_character(newCharacter):
	if currentCharacter:
		playerPosition = to_local(currentCharacter.global_transform.origin)
		currentCharacter.queue_free()

	currentCharacter = newCharacter.instance()
	add_child(currentCharacter)

	currentCharacter.global_transform.origin = to_global(playerPosition)
