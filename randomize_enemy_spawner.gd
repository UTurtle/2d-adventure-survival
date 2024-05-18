extends Spawner
class_name RandomizeSpawner

func randomize_attribute(e):
	e.melee_damage = randi_range(1, 1.1*SaveData.level)
	e.health = randi_range(1, 1*SaveData.level)
	e.speed = randf_range(0.03, 0.05*sqrt(SaveData.level))
	var s = randf_range(1, 1.1*(SaveData.level**(0.1)))
	e.entity_scale = Vector2(s, s)
	return e
	
func _process(delta):
	self.timer.wait_time = spawn_time/sqrt(SaveData.level)
	
func spawn():
	var e = enmey.instantiate()
	randomize_attribute(e)
	e.position = get_parent().get_node("Player").get_node("CharacterBody2D").position + Vector2(randf_range(100, 350), 0).rotated(randf_range(0, 2*PI))
	get_parent().add_child(e)

