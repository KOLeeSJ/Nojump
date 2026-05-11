class_name LookUpButtonTrick
extends Trick

# GDD §3.4 확정 후보: "낭떠러지 앞에서 위쪽을 일정 횟수 응시 → 화면 위에서 버튼 낙하 → 밟으면 점프 효과".

@export var button_scene: PackedScene
@export var look_up_threshold: float = 1.0
@export var button_spawn_position: Vector2 = Vector2(580, -100)
@export var button_land_y: float = 556.0
@export var impulse: float = -600.0

var look_up_time: float = 0.0
var triggered: bool = false
var player: Player = null


func _process(delta: float) -> void:
	if triggered:
		return
	if player == null or not is_instance_valid(player):
		player = get_tree().get_first_node_in_group("player") as Player
		if player == null:
			return

	if player.is_looking_up():
		look_up_time += delta
		if look_up_time >= look_up_threshold:
			_spawn_button()
	else:
		look_up_time = 0.0


func _spawn_button() -> void:
	triggered = true
	if button_scene == null:
		push_error("LookUpButtonTrick: button_scene not assigned")
		return
	var btn := button_scene.instantiate()
	add_child(btn)
	btn.global_position = button_spawn_position
	btn.land_y = button_land_y
	btn.stepped_on.connect(_on_button_stepped)


func _on_button_stepped(p: Player) -> void:
	activate(p, impulse)
