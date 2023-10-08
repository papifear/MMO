extends Control

const composite_sprites = preload("res://Sprites/CompositeSprites.gd")

@onready var username_field: LineEdit = get_node("CanvasLayer/VBoxContainer/GridContainer/LineEdit_Username")
@onready var password_field: LineEdit = get_node("CanvasLayer/VBoxContainer/GridContainer/LineEdit_Password")
@onready var login_button: Button = get_node("CanvasLayer/VBoxContainer/CenterContainer/HBoxContainer/Button_Login")
@onready var register_button: Button = get_node("CanvasLayer/VBoxContainer/CenterContainer/HBoxContainer/Button_Register")

@onready var avatar_panel: Panel = get_node("CanvasLayer/Panel")
@onready var avatar_animation_player: AnimationPlayer = get_node("CanvasLayer/Panel/Control/Avatar/CompositeSprites/AnimationPlayer")

@onready var face_left: Button = get_node("CanvasLayer/Panel/FaceContainer/FaceButtonContainer/ButtonLeftFace")
@onready var face_right: Button = get_node("CanvasLayer/Panel/FaceContainer/FaceButtonContainer/ButtonRightFace")
@onready var hair_left: Button = get_node("CanvasLayer/Panel/HairContainer/HairButtonContainer/ButtonLeftHair")
@onready var hair_right: Button = get_node("CanvasLayer/Panel/HairContainer/HairButtonContainer/ButtonRightHair")
@onready var hairColor_left: Button = get_node("CanvasLayer/Panel/HairColorContainer/HairColorButtonContainer/ButtonLeftHairColor")
@onready var hairColor_right: Button = get_node("CanvasLayer/Panel/HairColorContainer/HairColorButtonContainer/ButtonRightHairColor")
@onready var avatarOk: Button = get_node("CanvasLayer/Panel/ButtonOk")

@onready var bodySprite = get_node("CanvasLayer/Panel/Control/Avatar/CompositeSprites/Body")
@onready var faceSprite = get_node("CanvasLayer/Panel/Control/Avatar/CompositeSprites/Face")
@onready var hairSprite = get_node("CanvasLayer/Panel/Control/Avatar/CompositeSprites/Hair")

var face_id: int = 0
var hair_id: int = 0
var hairColor_id: int = 0

signal login(username, password)
signal register(username, password)

func _ready():
	password_field.secret = true
	avatar_panel.visible = false
	login_button.connect("pressed", _login)
	register_button.connect("pressed", _choose_avatar)
	
	face_right.connect("pressed", _next_face)
	face_left.connect("pressed", _prev_face)
	hair_right.connect("pressed", _next_hair)
	hair_left.connect("pressed", _prev_hair)
	hairColor_right.connect("pressed", _next_hairColor)
	hairColor_left.connect("pressed", _prev_hairColor)
	
	avatarOk.connect("pressed", _register)
	
func _login():
	emit_signal("login", username_field.text, password_field.text)
	
func _register():
	emit_signal("register", username_field.text, password_field.text, face_id, hair_id, hairColor_id)

func _choose_avatar():
	avatar_panel.visible = true
	avatar_animation_player.play("walk_down")

func _next_face():
	face_id = (face_id + 1) % composite_sprites.face_spritesheet.size()
	faceSprite.texture = composite_sprites.face_spritesheet[face_id]
	
func _prev_face():
	face_id = (face_id - 1) % composite_sprites.face_spritesheet.size()
	if face_id < 0:
		face_id = (composite_sprites.face_spritesheet.size() - 1)
	faceSprite.texture = composite_sprites.face_spritesheet[face_id]
	
func _next_hair():
	hair_id = (hair_id + 1) % composite_sprites.hair_spritesheet.size()
	hairSprite.texture = composite_sprites.hair_spritesheet[hair_id]
	
func _prev_hair():
	hair_id = (hair_id - 1) % composite_sprites.hair_spritesheet.size()
	if hair_id < 0:
		hair_id = (composite_sprites.hair_spritesheet.size() - 1)
	hairSprite.texture = composite_sprites.hair_spritesheet[hair_id]
	
func _next_hairColor():
	hairColor_id = (hairColor_id + 1) % composite_sprites.hairColors.size()
	hairSprite.self_modulate = composite_sprites.hairColors[hairColor_id]
	
func _prev_hairColor():
	hairColor_id = (hairColor_id - 1) % composite_sprites.hairColors.size()
	if hairColor_id < 0:
		hairColor_id = (composite_sprites.hairColors.size() - 1)
	hairSprite.self_modulate = composite_sprites.hairColors[hairColor_id]
