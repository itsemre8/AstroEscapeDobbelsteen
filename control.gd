extends Control

@onready var die = get_node("/root/Node3D/Dobbelsteen")
@onready var result_label = $"Result Label"
@onready var player1_btn = $"Player1 button"
@onready var player2_btn = $"Player2 button"
@onready var player3_btn = $"Player3 button"

var current_player = 0
var player_scores = {1: [], 2: [], 3: []}

func _ready():
	player1_btn.pressed.connect(_on_player1_pressed)
	player2_btn.pressed.connect(_on_player2_pressed)
	player3_btn.pressed.connect(_on_player3_pressed)
	
	if die:
		die.connect("die_settled", Callable(self, "_on_die_settled"))

func _on_player1_pressed():
	current_player = 1
	result_label.text = "Player 1 is rolling..."
	disable_buttons()
	die.roll_die()

func _on_player2_pressed():
	current_player = 2
	result_label.text = "Player 2 is rolling..."
	disable_buttons()
	die.roll_die()

func _on_player3_pressed():
	current_player = 3
	result_label.text = "Player 3 is rolling..."
	disable_buttons()
	die.roll_die()

func _on_die_settled(face_number):
	player_scores[current_player].append(face_number)
	result_label.text = "Player %d rolled: %d" % [current_player, face_number]
	await get_tree().create_timer(1.0).timeout
	enable_buttons()

func disable_buttons():
	player1_btn.disabled = true
	player2_btn.disabled = true
	player3_btn.disabled = true

func enable_buttons():
	player1_btn.disabled = false
	player2_btn.disabled = false
	player3_btn.disabled = false
