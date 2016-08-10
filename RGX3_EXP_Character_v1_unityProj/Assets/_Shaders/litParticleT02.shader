// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33603,y:32830,varname:node_9361,prsc:2|custl-5473-OUT,alpha-891-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:7251,x:31622,y:33116,varname:node_7251,prsc:2;n:type:ShaderForge.SFN_Append,id:7788,x:31802,y:33116,varname:node_7788,prsc:2|A-7251-XYZ,B-7251-W;n:type:ShaderForge.SFN_Matrix4x4Property,id:7497,x:31802,y:32956,ptovrint:False,ptlb:_Camera2World,ptin:_Camera2World,varname:node_3656,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,m00:1,m01:0,m02:0,m03:0,m10:0,m11:1,m12:0,m13:0,m20:0,m21:0,m22:1,m23:0,m30:0,m31:0,m32:0,m33:1;n:type:ShaderForge.SFN_LightPosition,id:5346,x:31955,y:32956,varname:node_5346,prsc:2;n:type:ShaderForge.SFN_MultiplyMatrix,id:415,x:31970,y:33116,varname:node_415,prsc:2|A-7497-OUT,B-7788-OUT;n:type:ShaderForge.SFN_Distance,id:3109,x:32132,y:32956,varname:node_3109,prsc:2|A-5346-XYZ,B-415-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1601,x:32132,y:33123,ptovrint:False,ptlb:LightFalloff,ptin:_LightFalloff,varname:node_4912,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Power,id:7735,x:32309,y:32956,varname:node_7735,prsc:2|VAL-3109-OUT,EXP-1601-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9185,x:32309,y:32885,ptovrint:False,ptlb:LightRange,ptin:_LightRange,varname:node_9876,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Subtract,id:3761,x:32470,y:32938,varname:node_3761,prsc:2|A-9185-OUT,B-7735-OUT;n:type:ShaderForge.SFN_Max,id:9947,x:32658,y:32938,varname:node_9947,prsc:2|A-3761-OUT,B-7614-OUT;n:type:ShaderForge.SFN_Vector1,id:7614,x:32454,y:33137,varname:node_7614,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7671,x:32518,y:33201,varname:node_7671,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:2916,x:32856,y:32938,varname:node_2916,prsc:2|IN-9947-OUT,IMIN-7614-OUT,IMAX-9185-OUT,OMIN-7614-OUT,OMAX-7671-OUT;n:type:ShaderForge.SFN_LightColor,id:2775,x:32856,y:32817,varname:node_2775,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8038,x:33060,y:32862,varname:node_8038,prsc:2|A-215-RGB,B-3845-RGB,C-2775-RGB,D-2916-OUT;n:type:ShaderForge.SFN_Min,id:4332,x:33269,y:32862,varname:node_4332,prsc:2|A-8038-OUT,B-8136-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8136,x:33095,y:33061,ptovrint:False,ptlb:LightClamp,ptin:_LightClamp,varname:node_1679,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Tex2d,id:215,x:32856,y:33102,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_215,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:3845,x:32774,y:33287,varname:node_3845,prsc:2;n:type:ShaderForge.SFN_Multiply,id:891,x:33307,y:33142,varname:node_891,prsc:2|A-215-A,B-3845-A;n:type:ShaderForge.SFN_Slider,id:7970,x:32790,y:33470,ptovrint:False,ptlb:SoftClip,ptin:_SoftClip,varname:node_7970,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3870709,max:1;n:type:ShaderForge.SFN_Multiply,id:5473,x:33492,y:33368,varname:node_5473,prsc:2|A-8277-OUT,B-4332-OUT;n:type:ShaderForge.SFN_DepthBlend,id:8277,x:33117,y:33470,varname:node_8277,prsc:2|DIST-7970-OUT;proporder:215-1601-9185-8136-7970;pass:END;sub:END;*/

Shader "Shader Forge/litParticleT02" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _LightFalloff ("LightFalloff", Float ) = 3
        _LightRange ("LightRange", Float ) = 1
        _LightClamp ("LightClamp", Float ) = 0.3
        _SoftClip ("SoftClip", Range(0, 1)) = 0.3870709
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _CameraDepthTexture;
            uniform float4x4 _Camera2World;
            uniform float _LightFalloff;
            uniform float _LightRange;
            uniform float _LightClamp;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _SoftClip;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float node_7614 = 0.0;
                float3 finalColor = (saturate((sceneZ-partZ)/_SoftClip)*min((_MainTexture_var.rgb*i.vertexColor.rgb*_LightColor0.rgb*(node_7614 + ( (max((_LightRange-pow(distance(_WorldSpaceLightPos0.rgb,mul(_Camera2World,float4(i.posWorld.rgb,i.posWorld.a))),_LightFalloff)),node_7614) - node_7614) * (1.0 - node_7614) ) / (_LightRange - node_7614))),_LightClamp));
                fixed4 finalRGBA = fixed4(finalColor,(_MainTexture_var.a*i.vertexColor.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _CameraDepthTexture;
            uniform float4x4 _Camera2World;
            uniform float _LightFalloff;
            uniform float _LightRange;
            uniform float _LightClamp;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _SoftClip;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float node_7614 = 0.0;
                float3 finalColor = (saturate((sceneZ-partZ)/_SoftClip)*min((_MainTexture_var.rgb*i.vertexColor.rgb*_LightColor0.rgb*(node_7614 + ( (max((_LightRange-pow(distance(_WorldSpaceLightPos0.rgb,mul(_Camera2World,float4(i.posWorld.rgb,i.posWorld.a))),_LightFalloff)),node_7614) - node_7614) * (1.0 - node_7614) ) / (_LightRange - node_7614))),_LightClamp));
                fixed4 finalRGBA = fixed4(finalColor * (_MainTexture_var.a*i.vertexColor.a),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
