// Additive particle.
// Does not receive shadows.

Shader "Custom/Lit Particle Additive" {

	Properties {
		_Color ("Main Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_MainTex ("Color (RGBA)", 2D) = "white" {}
	}

	SubShader {
		
		Pass {
			Tags {"Queue" = "Transparent" "RenderType" = "Transparent" "LightMode" = "ForwardBase"}
			Blend One One
			ZWrite Off
			
			CGPROGRAM

				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fwdbase
				#include "UnityCG.cginc"
				#include "AutoLight.cginc"
				#include "AutoLightParticle.cginc"
				#pragma target 3.0

				struct appdata {
					float4 vertex : POSITION;
					float3 normal : NORMAL;
					float3 texcoord : TEXCOORD0;
				};

				struct v2f {
					float4 pos : SV_POSITION;
					float2 uv : TEXCOORD0;
					float3 normal : TEXCOORD1;
					float3 lightDir : TEXCOORD2;
					LIGHTING_COORDS(3,4)
				};

				float4x4 _Camera2World;
				uniform float4 _MainTex_ST;

				v2f vert (appdata v) {
					v2f o;
					o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
					o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
					o.normal = v.normal;
					
					float4 posW = mul (_Camera2World, v.vertex);
					o.lightDir = WorldSpaceLightDirFromWorldPos(posW.xyz);
					
					TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(o);
					return o;
				}

				float4 _LightColor0;
				fixed4 _Color;
				sampler2D _MainTex;

				fixed4 frag(v2f i) : COLOR {
					fixed4 c = tex2D( _MainTex, i.uv ) * _Color;
					fixed atten = LIGHT_ATTENUATION(i);
					fixed NdotL = dot(i.normal, i.lightDir) * 0.5 + 0.5;
					c.rgb *= UNITY_LIGHTMODEL_AMBIENT * 2;
					c.rgb += c.rgb * _LightColor0.rgb * NdotL * atten * 2;
					return c;
				}

			ENDCG
		}

		Pass {
			Tags {"Queue" = "Transparent" "RenderType" = "Transparent" "LightMode" = "ForwardAdd"}
			Blend One One
			ZWrite Off
			
			CGPROGRAM

				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fwdadd
				#include "UnityCG.cginc"
				#include "AutoLight.cginc"
				#include "AutoLightParticle.cginc"
				#pragma target 3.0

				struct appdata {
					float4 vertex : POSITION;
					float3 normal : NORMAL;
					float3 texcoord : TEXCOORD0;
				};

				struct v2f {
					float4 pos : SV_POSITION;
					float2 uv : TEXCOORD0;
					float3 normal : TEXCOORD1;
					float3 lightDir : TEXCOORD2;
					LIGHTING_COORDS(3,4)
				};

				float4x4 _Camera2World;
				uniform float4 _MainTex_ST;

				v2f vert (appdata v) {
					v2f o;
					o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
					o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
					o.normal = v.normal;
					
					float4 posW = mul (_Camera2World, v.vertex);
					o.lightDir = WorldSpaceLightDirFromWorldPos(posW.xyz);
					
					TRANSFER_VERTEX_TO_FRAGMENT_PARTICLE(o);
					return o;
				}

				float4 _LightColor0;
				fixed4 _Color;
				sampler2D _MainTex;

				fixed4 frag(v2f i) : COLOR {
					fixed4 c = tex2D( _MainTex, i.uv ) * _Color;
					fixed atten = LIGHT_ATTENUATION(i);
					fixed NdotL = dot(i.normal, i.lightDir) * 0.5 + 0.5;
					c.rgb *= _LightColor0.rgb * NdotL * atten * 2;
					return c;
				}

			ENDCG
		}
	}
	FallBack Off
}
