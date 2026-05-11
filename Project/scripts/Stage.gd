extends Node2D

@export var death_reload_delay: float = 0.5

@onready var death_zone: Area2D = $DeathZone


func _ready() -> void:
	death_zone.body_entered.connect(_on_death_zone_body_entered)


func _on_death_zone_body_entered(body: Node) -> void:
	var player := body as Player
	if player == null:
		return
	player.die()
	await get_tree().create_timer(death_reload_delay).timeout
	get_tree().reload_current_scene()
