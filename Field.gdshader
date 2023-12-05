shader_type spatial;
render_mode diffuse_burley;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = vec3(0.4,0.8,0.4);
}