extends MultiMeshInstance3D

var Ocean

# Called when the node enters the scene tree for the first time.
func _ready():
	Ocean = get_node("Ocean3D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	material_override.set_shader_parameter("Waves", Ocean.get_waves_texture(0))
	material_override.set_shader_parameter("Angle", Ocean.wind_direction_degrees)
