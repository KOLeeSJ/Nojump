class_name Trick
extends Node2D

# Phase 2 트릭 시스템 인터페이스 1차 초안 (GDD §8.2).
# 모든 트릭은 발동 시 점프 유사 효과(상향 임펄스)를 통일된 방식으로 발생시킨다.
# 발동 조건은 서브클래스 자율, 효과는 `activate()` 호출로 일원화.

signal activated(player: Player)


func activate(player: Player, impulse: float) -> void:
	player.apply_jump_impulse(impulse)
	activated.emit(player)
