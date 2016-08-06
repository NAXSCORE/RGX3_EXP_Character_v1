inline float4 LightingCloud05 (SurfaceOutput s, fixed3 lightDir, fixed atten) {
	float4 c;
	c.rgb = s.Albedo.rgb + (_LightColor0.rgb * atten);
	c.a = s.Alpha;
	
	return c;
}

inline float4 LightingCloud05 (SurfaceOutput s, fixed3 lightDir, fixed3 viewDir, fixed atten) {
	return LightingCloud05 (s, lightDir, atten);
}

inline float4 LightingCloud05_PrePass (SurfaceOutput s, float4 light) {
	fixed4 c;
	c.rgb = s.Albedo * light.rgb;
	c.a = s.Alpha;
	return c;
}