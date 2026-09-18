extends Node2D

@onready var ball = $Ball
@onready var top_goal = $TopGoal
@onready var bottom_goal = $BottomGoal

func _ready() -> void:
	top_goal.goal_made.connect(_on_goal_made)
	bottom_goal.goal_made.connect(_on_goal_made)


func _on_goal_made(player: String) -> void:
	# TODO: Lógica para marcar los goles en la puntuación
	ball.reset(1)
