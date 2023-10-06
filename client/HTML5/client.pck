GDPC                �                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�      �      ��ᛜo��c�l���    T   res://.godot/exported/133200997/export-574ce98dcf878d6579d228c3fa8b9273-chatbox.scn �            �Mz�Msx��P�    ,   res://.godot/global_script_class_cache.cfg  �+             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �/      W       /Z=��v������k3b�       res://Main.gd   `      Z      u�}��������k�       res://chatbox.gd        �      g���0x�
�:1��*       res://chatbox.tscn.remap+      d       '����=�����\��.       res://icon.svg  ,      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       �%7�0|گz �tg��       res://main.tscn.remap   �+      a       �J�Sw� ������       res://packet.gd �      �      "pHRhnx�ô       res://project.binary00      �      t+�/�cD���΋���       res://websockets_client.gd  @#      �      �Q�{���3�K�~�v��    x.;�extends Control

@onready var chat_log = get_node("CanvasLayer/VBoxContainer/RichTextLabel")
@onready var input_field = get_node("CanvasLayer/VBoxContainer/HBoxContainer/LineEdit")

signal message_sent(message)

func _ready():
	input_field.connect("text_submitted", text_entered)

func _input(event: InputEvent):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_ENTER:
				input_field.grab_focus()
			KEY_ESCAPE:
				input_field.release_focus()

func add_message(text: String):
	chat_log.text += text + "\n"

func text_entered(text: String):
	if len(text) > 0:
		input_field.text = ""
		
		emit_signal("message_sent", text)
ݛ_ZRSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://chatbox.gd ��������      local://PackedScene_265ut          PackedScene          	         names "         Chatbox    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    CanvasLayer    VBoxContainer    anchor_top    RichTextLabel    size_flags_vertical    scroll_following    HBoxContainer    Label    text 	   LineEdit    size_flags_horizontal    	   variants    	                    �?                   ����   �+?            [SAY]:       node_count             nodes     W   ��������       ����                                                          	   	   ����               
   
   ����                                            ����                                       ����                          ����                                ����                          conn_count              conns               node_paths              editable_instances              version             RSRC�Y�Ȫ>�K<^GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[ ���9D�2x=k([remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c2khbvluuy0u3"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 Uw�;׬�#3_��extends Node

# Imports
const NetworkClient = preload("res://websockets_client.gd")
const Packet = preload("res://packet.gd")

@onready var _chatbox = get_node("Chatbox")
@onready var _network_client = NetworkClient.new()
## var state: FuncRef
var state

func _ready():
	###_network_client.connect("connected", self, "_handle_client_connected")
	###_network_client.connect("disconnected", self, "_handle_client_disconnected")
	###_network_client.connect("error", self, "_handle_network_error")
	###_network_client.connect("data", self, "_handle_network_data")
	_network_client.connect("connected", Callable(self, "_handle_client_connected"))
	_network_client.connect("disconnected", Callable(self, "_handle_client_disconnected"))
	_network_client.connect("error", Callable(self, "_handle_network_error"))
	_network_client.connect("data", Callable(self, "_handle_network_data"))
	add_child(_network_client)
	_network_client.connect_to_server("127.0.0.1", 8081)
	
	_chatbox.connect("message_sent", Callable(self, "send_chat"))
	
	state = Callable(self, "PLAY")
	
func PLAY(p):
	match p.action:
		"Chat":
			var message: String = p.payloads[0]
			_chatbox.add_message(message)
	
func send_chat(text: String):
	var p: Packet = Packet.new("Chat", [text])
	_network_client.send_packet(p)
	_chatbox.add_message(text)
	
func _handle_client_connected():
	print("Client connected to the server")
	
func _handle_client_disconnected(was_clean: bool):
	OS.alert("Disconnected %s" % ["cleanly" if was_clean else "unexpectedly"])
	get_tree().quit()
	
func _handle_network_data(data: String):
	print("Received server data: ", data)
	var action_payloads: Array = Packet.json_to_action_payloads(data)
	var p: Packet = Packet.new(action_payloads[0], action_payloads[1])
	# Pass the packet to our current state
	state.call_func(p)
	
func _handle_network_error():
	OS.alert("There was a network error")
�9��RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Main.gd ��������   PackedScene    res://chatbox.tscn @�-t�      local://PackedScene_gxibl 4         PackedScene          	         names "         Main    script    Node2D    Chatbox    	   variants                                node_count             nodes        ��������       ����                      ���                    conn_count              conns               node_paths              editable_instances              version             RSRC<l����extends Object

var action: String
var payloads: Array

func _init(_action: String, _payloads: Array):
	action = _action
	payloads = _payloads
	
func tostring() -> String:
	var serlialize_dict: Dictionary = {"a": action}
	for i in range(len(payloads)):
		serlialize_dict["p%d" % i] = payloads[i]
	var data: String = JSON.stringify(serlialize_dict)
	return data
	
static func json_to_action_payloads(json_str: String) -> Array:
	var action: String
	var payloads: Array = []
	### var obj_dict: Dictionary = JSON.parse(json_str).result
	var json = JSON.new()
	var obj_dict: Dictionary
	var error = json.parse(json_str)
	if error == OK:
		obj_dict = json.data
	else:
		print("Error while parsing JSON string")
	
	for key in obj_dict.keys():
		var value = obj_dict[key]
		if key == "a":
			action = value
		elif key[0] == "p":
			var index: int = key.split_floats("p", true)[1]
			payloads.insert(index, value)
			
	return [action, payloads]
O�� ��extends Node

const Packet = preload("res://packet.gd")

signal connected
signal data
signal disconnected
signal error

# Our WebSocketClient instance
var _client = WebSocketPeer.new()

func _ready():
	###_client.connect("connection_closed", self, "_closed")
	###_client.connect("connection_error", self, "_closed")
	###_client.connect("connection_established", self, "_connected")
	###_client.connect("data_received", self, "_on_data")
	pass
	
func connect_to_server(hostname: String, port: int) -> void:
	# Connects to the server or emits an error signal
	# If connected, emit a connect signal
	var websocket_url = "ws://%s:%d" % [hostname, port]
	var err = _client.connect_to_url(websocket_url)
	if err:
		print("Unable to connect")
		set_process(false)
		emit_signal("error")
	else: _connected()
		
func send_packet(packet: Packet) -> void:
	# Sends a packet to the server
	_send_string(packet.tostring())
	
#func _closed(was_clean = false):
#	print("Closed, clean: ", was_clean)
#	set_process(false)
#	emit_signal("disconnected", was_clean)
	
func _connected(proto = ""):
	print("Connected with protocol: ", proto)
	emit_signal("connected")
	
func _on_data():
	var data: String = _client.get_packet().get_string_from_utf8()
	print("Got data from server: ", data)
	emit_signal("data", data)
	
func _process(delta):
	_client.poll()
	var state = _client.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while _client.get_available_packet_count():
			#print("Packet: ", _client.get_packet())
			_on_data()
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = _client.get_close_code()
		var reason = _client.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_process(false) # Stop processing.
	
func _send_string(string: String) -> void:
	_client.put_packet(string.to_utf8_buffer())
	print("Sent string: ", string)
Qj�.��
<��[remap]

path="res://.godot/exported/133200997/export-574ce98dcf878d6579d228c3fa8b9273-chatbox.scn"
,܊,��bC��J[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
�u���/r�J�x��list=Array[Dictionary]([])
��6�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
��T�h��_$   @�-t�   res://chatbox.tscnh�+�$�\   res://icon.svg�5�[��x   res://main.tscnɱ}�lVAECFG      application/config/name         client     application/run/main_scene         res://main.tscn    application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     dotnet/project/assembly_name         client  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibilityXpCp�D �� �