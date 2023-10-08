extends Node

const Packet = preload("res://packet.gd")

signal connected
signal data
signal disconnected
signal error

# WebSocketPeer instance
var _client = WebSocketPeer.new()

func _ready():
	pass
	
func connect_to_server(hostname: String, port: int) -> void:
	# Connects to the server or emits an error signal
	# If connected, emit a connect signal
	#var client_trusted_cas = load("res://certs/server.crt")
	#var client_tls_options = TLSOptions.client_unsafe()
	var websocket_url = "ws://%s:%d" % [hostname, port]
	var err = _client.connect_to_url(websocket_url)#, client_tls_options)
	if err:
		print("Unable to connect")
		set_process(false)
		emit_signal("error")
	else: _connected()

func send_packet(packet: Packet) -> void:
	# Sends a packet to the server
	_send_string(packet.tostring())
	
func _connected(proto = ""):
	print("Connected with protocol: ", proto)
	emit_signal("connected")
	
func _process(delta):
	_client.poll()
	var state = _client.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while _client.get_available_packet_count():
			var data: String = _client.get_packet().get_string_from_utf8()
			emit_signal("data", data)
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = _client.get_close_code()
		var reason = _client.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_process(false) # Stop processing.
		emit_signal("disconnected", code != -1)
	
func _send_string(string: String) -> void:
	_client.put_packet(string.to_utf8_buffer())
	print("Sent string: ", string)
