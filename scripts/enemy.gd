extends CharacterBody2D

const SPEED: float = 150.0
@onready var player: Node2D = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(player.global_position)
	
	if not test_move(global_transform, dir):
		velocity = dir * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()
