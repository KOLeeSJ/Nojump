extends CharacterBody2D

signal jump_attempted(count: int)

const SPEED: float = 200.0
const GRAVITY: float = 980.0

enum State {
	IDLE,
	WALK,
	FALL,
	LOOK_UP,
	LOOK_DOWN,
	JUMP_INPUT,
	DEATH,
}

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast: RayCast2D = $RayCast2D

var jump_attempts: int = 0
var current_state: State = State.IDLE
var jump_input_locked: bool = false


func _ready() -> void:
	_change_state(State.IDLE)


func _physics_process(delta: float) -> void:
	if current_state == State.DEATH:
		velocity.x = 0.0
		_apply_gravity(delta)
		move_and_slide()
		return

	_apply_gravity(delta)

	if Input.is_action_just_pressed("jump"):
		_register_jump_input()

	var direction: float = 0.0
	if not jump_input_locked:
		direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	if direction < 0.0:
		animated_sprite.flip_h = true
	elif direction > 0.0:
		animated_sprite.flip_h = false

	move_and_slide()
	_update_state(direction)


func die() -> void:
	if current_state == State.DEATH:
		return
	jump_input_locked = false
	_change_state(State.DEATH)


func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta


func _register_jump_input() -> void:
	if jump_input_locked or current_state == State.DEATH:
		return
	jump_attempts += 1
	jump_attempted.emit(jump_attempts)
	jump_input_locked = true
	_change_state(State.JUMP_INPUT)
	await animated_sprite.animation_finished
	jump_input_locked = false


func _update_state(direction: float) -> void:
	if jump_input_locked or current_state == State.DEATH:
		return

	if not is_on_floor():
		_change_state(State.FALL)
		return

	if Input.is_action_pressed("look_up"):
		_change_state(State.LOOK_UP)
		return

	if Input.is_action_pressed("move_down"):
		_change_state(State.LOOK_DOWN)
		return

	if absf(direction) > 0.0:
		_change_state(State.WALK)
		return

	_change_state(State.IDLE)


func _change_state(new_state: State) -> void:
	if current_state == new_state:
		return
	current_state = new_state
	animated_sprite.play(_animation_for(new_state))


func _animation_for(state: State) -> StringName:
	match state:
		State.IDLE: return &"idle"
		State.WALK: return &"walk"
		State.FALL: return &"fall"
		State.LOOK_UP: return &"look_up"
		State.LOOK_DOWN: return &"look_down"
		State.JUMP_INPUT: return &"jump_input"
		State.DEATH: return &"death"
	return &"idle"
