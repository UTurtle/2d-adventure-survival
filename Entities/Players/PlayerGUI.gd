extends Control

@onready var score_label = $ScoreLabel
@onready var health_bar = $HealthBar
@onready var level_label = $LevelLabel

func _ready():
	health_bar.max_value = SaveData.health

func _process(_delta):
	health_bar.value = SaveData.health
	score_label.text = str(SaveData.score)
	level_label.text = "Level :" + str(SaveData.level)
