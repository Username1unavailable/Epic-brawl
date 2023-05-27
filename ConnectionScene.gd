extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Host_pressed():
	var player_name = $Name.text
	$"/root/gamestate".host_game(player_name)


func _on_Join_pressed():
	var player_name = $Name.text
	var ip = $Join/IP.text
	
	if not ip.is_valid_ip_address():
		$Error.text = "Invalid IP address!"
		return

	
	$"/root/gamestate".join_game(ip, player_name)
	pass # Replace with function body.


func _on_HostBegin_pressed():
	$"/root/gamestate".begin_game()
