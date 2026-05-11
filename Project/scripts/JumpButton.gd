extends Node2D

signal stepped_on(player: Player)

@export var fall_speed: float = 500.0
@export var land_y: float = 556.0

var landed: bool = false
var used: bool = false

@onready var detector: Area2D = $Detector


func _ready() -> void:
	detector.body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	if landed or used:
		return
	position.y += fall_speed * delta
	if global_position.y >= land_y:
		global_position.y = land_y
		landed = true


func _on_body_entered(body: Node) -> void:
	if used or not landed:
		return
	var player := body as Player
	if player == null:
		return
	used = true
	stepped_on.emit(player)
	queue_free()
