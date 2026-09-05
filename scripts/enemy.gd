extends CharacterBody2D

const SPEED: float = 150.0
@onready var player: Node2D = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	var dir_to_player = global_position.direction_to(player.global_position)
	
	if not test_move(global_transform, dir_to_player):
		velocity = dir_to_player * SPEED
	else:
		var best_dir = Vector2.ZERO
		var best_score = float("-inf")
		
		for degree in range(-180, 180 + 1, 15):
			var candidate = dir_to_player.rotated(deg_to_rad(degree))
			var dot_player = candidate.dot(dir_to_player)
			var dot_current = candidate.dot(velocity.normalized())
			var score = dot_player + dot_current * 1.5 if not test_move(global_transform, candidate) else float("-inf")

			if score > best_score:
				best_dir = candidate
				best_score = score
				
		velocity = best_dir * SPEED
	move_and_slide()
