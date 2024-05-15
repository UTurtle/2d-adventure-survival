extends Spawner
class_name RandomizeSpawner

func randomize_attribute(e):
	e.melee_damage = randi_range(1, 5)
	e.health = randi_range(1, 1)
	e.speed = randf_range(0.01, 0.3)
	var s = randf_range(1, 2)
	e.entity_scale = Vector2(s, s)
	return e

func spawn():
	var e = enmey.instantiate()
	randomize_attribute(e)
	e.position = get_parent().get_node("Player").get_node("CharacterBody2D").position + Vector2(100, 0).rotated(randf_range(0, 2*PI))
	get_parent().add_child(e)

