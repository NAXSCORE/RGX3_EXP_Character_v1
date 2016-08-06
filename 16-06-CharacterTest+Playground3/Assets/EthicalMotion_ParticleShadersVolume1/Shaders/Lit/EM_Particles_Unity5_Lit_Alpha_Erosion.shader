Shader "Ethical Motion/Particles/Unity5/Lit Alpha Erosion" {
	Properties {
		_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_InvFade ("Soft Particles Factor", Range(0.01,3.0)) = 1.0
		_Thickness ("Thickness Factor", Range(0.0, 0.2)) = 0.05
		_Cutoff ("Alpha cutoff", Range(0,1) ) = 0.5
	}
	SubShader {
	
		Tags { "RenderType"="Transparent" "IgnoreProjector"="True" "Queue"="Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
		AlphaTest Greater .01
		Cull Back
		Zwrite Off
 		Lighting Off
		
		CGPROGRAM
		#pragma surface surf Smoke noforwardadd addshadow alpha:fade nodynlightmap nodirlightmap 
		#pragma target 3.0
		#include "EMLighting.cginc"

		sampler2D _MainTex;
		fixed4 _TintColor;
	
		struct Input {
			float2 uv_MainTex;
			float4 color : COLOR;
		};

		void surf (Input i, inout SurfaceOutputSmoke o) {
			fixed4 c = tex2D(_MainTex, i.uv_MainTex);
			c.rgb *= _TintColor.rgb * i.color.rgb;
			o.Albedo = 2 * c.rgb;
			o.Alpha = 2 * (c.a - abs(1 - i.color.a) );
		}
		ENDCG
	} 
	Fallback "Hidden/Ethical Motion/Particles/Lit Alpha Blend Shadow Fallback"
}
