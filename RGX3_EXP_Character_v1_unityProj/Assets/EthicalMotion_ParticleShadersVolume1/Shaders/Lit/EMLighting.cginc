fixed _Thickness;

struct SurfaceOutputSmoke
{
    fixed3 Albedo;  // diffuse color
    fixed3 Normal;  // tangent space normal, if written
    fixed3 Emission;
    half Specular;  // specular power in 0..1 range
    fixed Gloss;    // specular intensity
    fixed Alpha;    // alpha for transparencies
    fixed3 SelfIllumin; // self illumination
};

inline fixed4 LightingSmoke (SurfaceOutputSmoke s, fixed3 lightDir, fixed atten)
{
	fixed diff = max (0, dot (s.Normal, lightDir));
	diff = diff * (1 - _Thickness) + _Thickness;
	
	fixed4 c;
	c.rgb = s.Albedo * _LightColor0.rgb * diff * atten;
	c.a = saturate(s.Alpha);
	return c;
}

inline fixed4 LightingSmokeSelfIlluminated (SurfaceOutputSmoke s, fixed3 lightDir, fixed atten)
{
	fixed diff = max (0, dot (s.Normal, lightDir));
	diff = diff * (1 - _Thickness) + _Thickness;
	
	fixed4 c;
	c.rgb = s.Albedo * _LightColor0.rgb * diff * atten + s.SelfIllumin;
	c.a = saturate(s.Alpha);
	return c;
}