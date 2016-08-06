// Cutout particle.
// Receives shadows.

Shader "Custom/Lit Particle Cutout" {

	Properties {
		_Color ("Main Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_MainTex ("Color (RGBA)", 2D) = "white" {}
		_Cutoff ("Alpha Cutoff", Range(0,1) ) = 0.5
	}

	SubShader {

		Pass {
			Tags {"Queue" = "Geometry" "RenderType" = "TransparentCutout" "LightMode" = "ForwardBase"}
			
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
				float _Cutoff;

				fixed4 frag(v2f i) : COLOR {
					fixed4 c = tex2D( _MainTex, i.uv ) * _Color;
					clip( c.a - _Cutoff );
					
					fixed atten = LIGHT_ATTENUATION(i);
					fixed NdotL = saturate(dot(i.normal, i.lightDir));
					
					c.rgb *= UNITY_LIGHTMODEL_AMBIENT * 2;
					c.rgb += c.rgb * _LightColor0.rgb * NdotL * atten * 2;
					return c;
				}

			ENDCG
		}

		Pass {
			Tags {"Queue" = "Geometry" "RenderType" = "TransparentCutout" "LightMode" = "ForwardAdd"}
			Blend One One
			
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
				float _Cutoff;

				fixed4 frag(v2f i) : COLOR {
					fixed4 c = tex2D( _MainTex, i.uv ) * _Color;
					clip( c.a - _Cutoff );
					
					fixed atten = LIGHT_ATTENUATION(i);
					fixed NdotL = dot(i.normal, i.lightDir) * 0.5 + 0.5;
					
					c.rgb *= _LightColor0.rgb * NdotL * atten * 2;
					return c;
				}

			ENDCG
		}

		// SHADOW CASTER
		// Currently removed as particles billboard towards the camera and so end up casting shadows on themselves.
		/*
		Pass {
				Name "Caster"
				Tags { "LightMode" = "ShadowCaster" }
				Offset 1, 1
				
				Fog {Mode Off}
				ZWrite On ZTest LEqual Cull Off
		
				CGPROGRAM
					#pragma vertex vert
					#pragma fragment frag
					#pragma multi_compile_shadowcaster
					#pragma fragmentoption ARB_precision_hint_fastest
					#include "UnityCG.cginc"
					#include "AutoLightParticle.cginc"
					
					struct v2f { 
						V2F_SHADOW_CASTER;
						float2  uv : TEXCOORD1;
					};
					
					uniform float4 _MainTex_ST;
					float4x4 _Camera2World;
					
					v2f vert( appdata_base v )
					{
						v2f o;
						TRANSFER_SHADOW_CASTER_PARTICLE(o)
						o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
						return o;
					}
					
					uniform sampler2D _MainTex;
					uniform fixed _Cutoff;
					uniform fixed4 _Color;
					
					float4 frag( v2f i ) : COLOR
					{
						fixed4 texcol = tex2D( _MainTex, i.uv );
						clip( texcol.a*_Color.a - _Cutoff );
						
						SHADOW_CASTER_FRAGMENT(i)
					}
				ENDCG
		
			}*/
		
			// SHADOW COLLECTOR
			Pass {
				Name "ShadowCollector"
				Tags { "LightMode" = "ShadowCollector" }
				
				Fog {Mode Off}
				ZWrite On ZTest LEqual
		
				CGPROGRAM
					#pragma vertex vert
					#pragma fragment frag
					#pragma fragmentoption ARB_precision_hint_fastest
					#pragma multi_compile_shadowcollector
					
					#define SHADOW_COLLECTOR_PASS
					#include "UnityCG.cginc"
					#include "AutoLightParticle.cginc"
					
					struct v2f {
						V2F_SHADOW_COLLECTOR;
						float2  uv : TEXCOORD5;
					};
					
					uniform float4 _MainTex_ST;
					float4x4 _Camera2World;
					
					v2f vert (appdata_base v)
					{
						v2f o;
						TRANSFER_SHADOW_COLLECTOR_PARTICLE(o)
						o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
						return o;
					}
					
					uniform sampler2D _MainTex;
					uniform fixed _Cutoff;
					uniform fixed4 _Color;
					
					fixed4 frag (v2f i) : COLOR
					{
						fixed4 texcol = tex2D( _MainTex, i.uv );
						clip( texcol.a*_Color.a - _Cutoff );
						
						SHADOW_COLLECTOR_FRAGMENT(i)
					}
				ENDCG
			}
	}
	FallBack Off
}
