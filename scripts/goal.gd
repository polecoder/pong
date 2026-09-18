extends Area2D

signal goal_made(player: String)

@export var goal_made_by = "Player"

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball": goal_made.emit(goal_made_by)
