Shader "Cloud/Lightning Cloud 05" {

	Properties {
		_MainTex ("Particle Texture", 2D) = "white" {}
	}
	
	SubShader {
		Tags {
			"Queue"="Transparent"
			"IgnoreProjector"="True"
			"RenderType"="Transparent"
		}
	
		CGPROGRAM
		#include "UnityCG.cginc"
		#include "CloudLighting.cginc"
		#pragma surface surf Cloud05 alpha noambient nolightmap noforwardadd vertex:vert

		sampler2D _MainTex;
		
		struct Input {
			float2 uv_MainTex;
			float4 vertexColor;
		};
		
		void vert (inout appdata_full v, out Input o) {
			o.vertexColor.rgb = v.color.rgb;
			o.vertexColor.a = v.color.a;
			v.normal = float4 (0, 0, 1, 0).xyz;
			v.tangent = float4 (0, 0, 0, 0);
		}
		
		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb * (IN.vertexColor.rgb);
			o.Alpha = c.a * (IN.vertexColor.a);
		}
		ENDCG
	}
}