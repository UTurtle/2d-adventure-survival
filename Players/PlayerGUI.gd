extends Control

@onready var score_label = $ScoreLabel
@onready var health_bar = $HealthBar

func _ready():
	health_bar.max_value = SaveData.health

func _process(delta):
	health_bar.value = SaveData.health
	score_label.text = str(SaveData.score)
