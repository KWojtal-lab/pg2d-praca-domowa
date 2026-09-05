extends Area2D
class_name Hitbox

var damage = 20

func deal_damage(hurtbox: Hurtbox):
	hurtbox.take_damage(damage)

func _on_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		deal_damage(area)
