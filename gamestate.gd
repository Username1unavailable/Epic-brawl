extends Node

signal connection_suceeded

const DEFAULT_PORT = 10567

var begin_game_scene = preload("res://davidsnettestscene.tscn")

var peer
var player_ty
var player_name
var players = {}

func join_game(ip, name):
	player_name = name;
	peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(peer)
	
func host_game(name):
	player_name = name;
	peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, 2)
	get_tree().set_network_peer(peer)
	
func begin_game():
	assert(get_tree().is_network_server())
	
	var spawns = []
	for p in players:
		spawns.push_back(p)
	spawns.push_back(get_tree().get_network_unique_id())
	print(spawns)
	
	for p in players:
		rpc_id(p, "pre_start_game", spawns)
		
	pre_start_game(spawns)
	
remote func pre_start_game(spawns):
	print("running prestart game")
	var test_scene = load("res://davidsnettestscene.tscn")
	print(spawns)
	
	for player_id in spawns:
		var scene
		match player_ty:
			"Elon":
				scene = "res://PlayerElonMusk.tscn"
			"Wizard":
				scene = "res://shapeshiftingwizard.tscn"
			"Knight":
				scene = "res://knight.tscn"
		var player = load(scene).instance()
		print("AAA ", player_id)

		player.set_name(str(player_id))
		player.set_network_master(player_id)
		get_tree().get_root().add_child(player)
		
	get_tree().change_scene_to(test_scene)
	
remote func register_player(name):
	var id = get_tree().get_rpc_sender_id()
	print(id)
	players[id] = name

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _player_connected(id):
	rpc_id(id, "register_player", player_name)
	print("player connected")
	pass
	
func _player_disconnected():
	print("player disconnected")
	pass
	
func _connected_ok():
	print("connected ok")
	pass
	
func _connected_fail():
	print("connected fail")
	pass
	
func _server_disconnected():
	print("server disconnected")
	pass
