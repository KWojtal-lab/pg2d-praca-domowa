extends CharacterBody2D

const SPEED: float = 150.0
const MIN_TEST_ANGLE = -180
const MAX_TEST_ANGLE = 180
const STEP_TEST_ANGLE = 15
const CHECK_DIST = 30.0
const CURRENT_DIR_ADVANTAGE_MULTIPLIER = 1.5
@onready var player: Node2D = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	var dir_to_player = global_position.direction_to(player.global_position)
	
	if not test_move(global_transform, dir_to_player * CHECK_DIST):
		velocity = dir_to_player * SPEED
	else:
		var best_dir = Vector2.ZERO
		var best_score = float("-inf")
		
		for degree in range(MIN_TEST_ANGLE, MAX_TEST_ANGLE + 1, STEP_TEST_ANGLE):
			var candidate = dir_to_player.rotated(deg_to_rad(degree))
			var dot_player = candidate.dot(dir_to_player)
			var dot_current = candidate.dot(velocity.normalized())
			var score = dot_player + dot_current * CURRENT_DIR_ADVANTAGE_MULTIPLIER \
				if not test_move(global_transform, candidate * CHECK_DIST) else float("-inf")

			if score > best_score:
				best_dir = candidate
				best_score = score
				
		velocity = best_dir * SPEED
	move_and_slide()
