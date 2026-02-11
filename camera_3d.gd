extends Camera3D

@export var target_path: NodePath = "../Dobbelsteen"
@export var follow_distance = 5.0
@export var follow_height = 3.0
@export var follow_speed = 5.0

var target: Node3D

func _ready():
	target = get_node(target_path)

func _process(delta):
	if target:
		# Calculate desired camera position
		var desired_pos = target.global_position + Vector3(0, follow_height, follow_distance)
		
		# Smoothly move camera to desired position
		global_position = global_position.lerp(desired_pos, follow_speed * delta)
		
		# Look at the die
		look_at(target.global_position, Vector3.UP)
