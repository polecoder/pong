extends Node2D

@onready var ball = $Ball
@onready var top_goal = $TopGoal
@onready var bottom_goal = $BottomGoal
@onready var player_score_label = $Hud/PlayerScore
@onready var enemy_score_label = $Hud/EnemyScore
var player_score = 0
var enemy_score = 0

func _ready() -> void:
	top_goal.goal_made.connect(_on_goal_made)
	bottom_goal.goal_made.connect(_on_goal_made)


func _on_goal_made(player: String) -> void:
	if (player == "Enemy"):
		enemy_score += 1
		enemy_score_label.text = "%d" % enemy_score
	else:
		player_score += 1
		player_score_label.text = "%d" % player_score
	ball.reset(1)
