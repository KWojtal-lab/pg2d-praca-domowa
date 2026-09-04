extends CharacterBody2D

const SPEED: float = 150.0
@onready var player: Node2D = get_tree().current_scene.get_node("Player")

var sees_player: bool = false

func _physics_process(_delta: float) -> void:
	var space_state = get_world_2d().direct_space_state
	
	var query = PhysicsRayQueryParameters2D.create(
		global_position, 
		player.global_position, 
		collision_mask, 
		[self.get_rid()]
	)
	var result = space_state.intersect_ray(query)

	if result.collider == player:
		sees_player = true
		
		var dir = global_position.direction_to(player.global_position)
		velocity = dir * SPEED
	else:
		sees_player = false
		velocity = Vector2.ZERO

	move_and_slide()
	
	queue_redraw()

func _draw() -> void:		
	var target_local_pos = to_local(player.global_position)
	var color = Color.GREEN if sees_player else Color.RED
	
	draw_line(Vector2.ZERO, target_local_pos, color, 5.0)
