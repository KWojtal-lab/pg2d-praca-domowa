extends CharacterBody2D

const SPEED: float = 150.0
@onready var player: Node2D = get_tree().current_scene.get_node("Player")

func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(player.global_position)
	
	if not test_move(global_transform, dir):
		velocity = dir * SPEED
	else:
		var best_dir = Vector2.ZERO
		var best_score = float("-inf")
		
		var test_degrees = range(-90, 90 + 1, 30)
		for degree in test_degrees:
			var candidate = dir.rotated(deg_to_rad(degree))
			var score = candidate.dot(dir) if not test_move(global_transform, candidate) else float("-inf")
			
			if score > best_score:
				best_dir = candidate
				best_score = score
				
		velocity = best_dir * SPEED
	move_and_slide()
