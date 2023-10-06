extends "res://model.gd"

@onready var body: CharacterBody2D = get_node("CharacterBody2D")
@onready var label: Label = get_node("CharacterBody2D/Label")
@onready var sprite: Sprite2D = get_node("CharacterBody2D/Avatar")
@onready var animation_player: AnimationPlayer = get_node("CharacterBody2D/Avatar/AnimationPlayer")

var server_position: Vector2
var actor_name: String
#var velocity: Vector2 = Vector2.ZERO

var is_player: bool = false
var _player_target: Vector2

var initialised_position: bool = false

var rubber_band_radius: float = 200

var speed: float = 70.0 # also present in _update_position in protocol.py

func _ready():
	update(initial_data)

func update(new_model: Dictionary):
	super(new_model)
	
	# Set the correct sprite for the actor's avatar ID
	if new_model.has("avatar_id"):
		sprite.set_region_rect(Rect2(new_model["avatar_id"] * 72, 0, 72, 128))
	
	if new_model.has("instanced_entity"):
		var ientity = new_model["instanced_entity"]
		if ientity.has("x") and ientity.has("y"):
			server_position = Vector2(float(ientity["x"]), float(ientity["y"]))

			if not initialised_position:
				initialised_position = true
				body.position = server_position
				if is_player:
					_player_target = server_position

			elif (body.position - server_position).length() > rubber_band_radius:
				# Rubber band if body position is too far away from server position
				body.position = server_position

		if ientity.has("entity"):
			var entity = ientity["entity"]
			if entity.has("name"):
				actor_name = entity["name"]
				
				if label:
					label.text = actor_name

func _physics_process(delta):
	if not body:
		return

	var target: Vector2
	if is_player:
		target = _player_target
	elif server_position:
		target = server_position

	body.velocity = (target - body.position).normalized() * speed
	if (target - body.position).length() > 5:
		body.move_and_slide()
	else:
		body.velocity = Vector2.ZERO

func _process(delta):
	# Get the direction angle
	var angle = body.velocity.angle()
	var waiting: bool = false
	
	if body.velocity.length() <= 5:
		animation_player.stop()
	# Check which quadrant the angle is in and play the animation accordingly
	elif -PI/4 <= angle and angle < PI/4:
		animation_player.play("walk_right")
	elif PI/4 <= angle and angle < 3*PI/4:
		animation_player.play("walk_down")
	elif -3*PI/4 <= angle and angle < -PI/4:
		animation_player.play("walk_up")
	else:
		animation_player.play("walk_left")
