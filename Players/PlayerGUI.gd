extends Control

@onready var score_label = $ScoreLabel
@onready var health_bar = $HealthBar
@onready var health = get_parent().health

func _ready():
	health_bar.value = health

func _process(delta):
	health_bar.value = health
	score_label.text = str(Global.score)
