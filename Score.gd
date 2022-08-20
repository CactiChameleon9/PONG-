extends Label

signal goal_scored

var player_score : int = 0
var opp_score : int = 0

func _ready():
	update_label()

func update_label():
	self.text = str(player_score) + "  " + str(opp_score)

func increase_player_score(_body = null):
	player_score += 1
	update_label()
	emit_signal("goal_scored")

func increase_opp_score(_body = null):
	opp_score += 1
	update_label()
	emit_signal("goal_scored")
