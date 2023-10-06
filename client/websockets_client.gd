extends Node

const Packet = preload("res://packet.gd")

signal connected
signal data
signal disconnected
signal error

# Our WebSocketClient instance
var _client = WebSocketPeer.new()

func _ready():
	_client.connect("connection_closed", _closed)
	_client.connect("connection_error", _closed)
	#_client.connect("connection_established", _connected)
	#_client.connect("data_received", _on_data)
	pass
	
func connect_to_server(hostname: String, port: int) -> void:
	# Connects to the server or emits an error signal
	# If connected, emit a connect signal
	var websocket_url = "wss://%s:%d" % [hostname, port]
	var err = _client.connect_to_url(websocket_url, TLSOptions.client_unsafe())
	if err:
		print("Unable to connect")
		set_process(false)
		emit_signal("error")
	else: _connected()
		
func send_packet(packet: Packet) -> void:
	# Sends a packet to the server
	_send_string(packet.tostring())
	
func _closed(was_clean = false):
	print("Closed, clean: ", was_clean)
	set_process(false)
	emit_signal("disconnected", was_clean)
	
func _connected(proto = ""):
	print("Connected with protocol: ", proto)
	emit_signal("connected")
	
func _on_data():
	var data: String = _client.get_packet().get_string_from_utf8()
	#print("Got data from server: ", data)
	emit_signal("data", data)
	
func _process(delta):
	_client.poll()
	var state = _client.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while _client.get_available_packet_count():
			_on_data()
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		#var code = _client.get_close_code()
		#var reason = _client.get_close_reason()
		#print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		#emit_signal("disconnected", code != -1)
		set_process(false) # Stop processing.
	
func _send_string(string: String) -> void:
	_client.put_packet(string.to_utf8_buffer())
	print("Sent string: ", string)
