extends Area2D
class_name Hurtbox

var health = 100

signal damage_taken(new_health: int)

func take_damage(damage: int) -> void:
	health = max(0, health - damage)
	damage_taken.emit(health)
	
	if health <= 0:
		get_parent().queue_free()
