extends Node

var health = 10
var score = 0
var level = 1
var base_level = 10
var melee_damage = 1

func _ready():
	pass

func _process(_delta):
	if score >= base_level*level*level:
		level += 1
		# how to add signal to other node?
		

