shader_type spatial;
render_mode diffuse_burley, cull_disabled;

uniform float Angle;

void vertex() {
	vec3 WorldPos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	
	//Direction of wind movement
	vec2 Direction = vec2(cos(Angle), sin(Angle));
	
	float WindMovement = pow(VERTEX.y, 2) * sin(WorldPos.x + WorldPos.z  + TIME);
	
	VERTEX.xz = WindMovement * Direction;
	
	//VERTEX.x += sin((WorldPos.x + WorldPos.z) + TIME) * pow(WorldPos.y, 2) ;
	//VERTEX.z += sin((WorldPos.x + WorldPos.z) + TIME) * pow(WorldPos.y, 2) ;
	//VERTEX.x = (vec4(WorldPos, 1.0) * inverse(MODEL_MATRIX)).x;
}

void fragment() {
	vec3 light = vec3(0.4,0.8,0.4);
	
	vec3 dark = vec3(0.2,0.6,0.2);
	
	ALBEDO = mix(light, dark, UV.y*3.0);
	
	if (!FRONT_FACING)
	{
		NORMAL = -NORMAL;
	}
	//ALBEDO = vec3(UV, 0);
}