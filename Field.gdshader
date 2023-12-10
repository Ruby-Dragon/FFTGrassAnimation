shader_type spatial;
render_mode diffuse_burley, cull_disabled;

uniform float Angle;
uniform sampler2D Noise;

varying float Wind;

void vertex() {
	vec3 WorldPos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	
	vec2 WorldUV = TIME * 6.0 + WorldPos.xz;
	
	//Direction of wind movement
	vec2 Direction = normalize(vec2(cos(Angle), sin(Angle)));
	
	float WindMovement = pow(VERTEX.y, 2) * (sin((WorldUV.x * Direction.x + WorldUV.y * Direction.y) * 0.3) + 1.0) * 0.1;
	
	Wind = WindMovement;
	
	VERTEX.xz += (WindMovement) * -Direction;
	//VERTEX.y -= WindMovement / (Direction.x + Direction.y);
	
	//VERTEX.x += sin((WorldPos.x + WorldPos.z) + TIME) * pow(WorldPos.y, 2) ;
	//VERTEX.z += sin((WorldPos.x + WorldPos.z) + TIME) * pow(WorldPos.y, 2) ;
	//VERTEX.x = (vec4(WorldPos, 1.0) * inverse(MODEL_MATRIX)).x;
}

void fragment() {
	vec3 light = vec3(0.4,0.8,0.4);
	
	vec3 dark = vec3(0.2,0.6,0.2);
	
	ALBEDO = mix(light, dark, UV.y*3.0);
	
	//ALBEDO = vec3(Wind, Wind, Wind);
	
	if (!FRONT_FACING)
	{
		NORMAL = -NORMAL;
	}
	//ALBEDO = vec3(UV, 0);
}