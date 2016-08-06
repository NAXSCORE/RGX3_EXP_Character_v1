// Upgrade NOTE: replaced '_LightMatrix0' with 'unity_WorldToLight'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'unity_World2Shadow' with 'unity_WorldToShadow'

// Helper macros specific to particles for lighting and shadows.
// Required.
// Keep this in the same directory as the other lit particle shader files.

#ifdef AUTOLIGHT_INCLUDED
	
	// ---- Screen space shadows
	#if defined (SHADOWS_SCREEN)
		#define TRANSFER_SHADOW_PARTICLE(a) a._ShadowCoord = ComputeScreenPos(o.pos);
	#endif
	
	// ---- Depth map shadows
	#if defined (SHADOWS_DEPTH) && defined (SPOT)
		#define TRANSFER_SHADOW_PARTICLE(a) a._ShadowCoord = mul (unity_WorldToShadow, posW);
	#endif
	
	// ---- Point light shadows
	#if defined (SHADOWS_CUBE)
		#define TRANSFER_SHADOW_PARTICLE(a) a._ShadowCoord = posW - _LightPositionRange.xyz;
	#endif
	
	// ---- Shadows off
	#if !defined (SHADOWS_SCREEN) && !defined (SHADOWS_DEPTH) && !defined (SHADOWS_CUBE)
		#define TRANSFER_SHADOW_PARTICLE(a)
	#endif
	
	// ------------ Light helpers --------
	#ifdef POINT
		#define TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(a) a._LightCoord = mul(unity_WorldToLight, posW).xyz; TRANSFER_SHADOW_PARTICLE(a)
	#endif
	
	#ifdef SPOT
		#define TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(a) a._LightCoord = mul(unity_WorldToLight, posW); TRANSFER_SHADOW_PARTICLE(a)
	#endif
	
	#ifdef DIRECTIONAL
		#define TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(a) TRANSFER_SHADOW_PARTICLE(a)
	#endif
	
	#ifdef POINT_COOKIE
		#define TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(a) a._LightCoord = mul(unity_WorldToLight, posW).xyz; TRANSFER_SHADOW_PARTICLE(a)
	#endif
	
	#ifdef DIRECTIONAL_COOKIE
		#define TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(a) a._LightCoord = mul(unity_WorldToLight, posW).xy; TRANSFER_SHADOW_PARTICLE(a)
	#endif

#endif //AUTOLIGHT_INCLUDED


#ifdef UNITY_CG_INCLUDED

	// Light direction from world position
	inline float3 WorldSpaceLightDirFromWorldPos( in float3 worldPos )
	{
		#ifndef USING_LIGHT_MULTI_COMPILE
			return _WorldSpaceLightPos0.xyz - worldPos * _WorldSpaceLightPos0.w;
		#else
			#ifndef USING_DIRECTIONAL_LIGHT
			return _WorldSpaceLightPos0.xyz - worldPos;
			#else
			return _WorldSpaceLightPos0.xyz;
			#endif
		#endif
	}


	// Shadow caster pass helpers
	// Currently unused as particles billboard and so cast shadows on themselves.
		
	#ifdef SHADOWS_CUBE
		#define TRANSFER_SHADOW_CASTER_PARTICLE(o) o.vec = mul(_Camera2World, v.vertex).xyz - _LightPositionRange.xyz; o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
	#else
		#if defined(UNITY_MIGHT_NOT_HAVE_DEPTH_TEXTURE)
			#define TRANSFER_SHADOW_CASTER_PARTICLE(o) o.pos = mul(UNITY_MATRIX_MVP, v.vertex); o.pos.z += unity_LightShadowBias.x; \
			float clamped = max(o.pos.z, o.pos.w*UNITY_NEAR_CLIP_VALUE); o.pos.z = lerp(o.pos.z, clamped, unity_LightShadowBias.y); o.hpos = o.pos;
		#else
			#define TRANSFER_SHADOW_CASTER_PARTICLE(o) o.pos = mul(UNITY_MATRIX_MVP, v.vertex); o.pos.z += unity_LightShadowBias.x; \
			float clamped = max(o.pos.z, o.pos.w*UNITY_NEAR_CLIP_VALUE); o.pos.z = lerp(o.pos.z, clamped, unity_LightShadowBias.y);
		#endif
	#endif
	
	// Shadow collector pass helpers
	#ifdef SHADOW_COLLECTOR_PASS
		#define TRANSFER_SHADOW_COLLECTOR_PARTICLE(o)	\
			o.pos = mul(UNITY_MATRIX_MVP, v.vertex); \
			float4 wpos = mul(_Camera2World, v.vertex); \
			float4 opos = mul(unity_WorldToObject, wpos); \
			o._WorldPosViewZ.xyz = wpos; \
			o._WorldPosViewZ.w = -mul( UNITY_MATRIX_MV, v.vertex ).z; \
			o._ShadowCoord0 = mul(unity_WorldToShadow[0], wpos).xyz; \
			o._ShadowCoord1 = mul(unity_WorldToShadow[1], wpos).xyz; \
			o._ShadowCoord2 = mul(unity_WorldToShadow[2], wpos).xyz; \
			o._ShadowCoord3 = mul(unity_WorldToShadow[3], wpos).xyz;
	#endif

#endif //UNITY_CG_INCLUDED
