// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:34479,y:32725,varname:node_4013,prsc:2|alpha-2737-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:5008,x:32410,y:32951,varname:node_5008,prsc:2;n:type:ShaderForge.SFN_Append,id:8879,x:32590,y:32951,varname:node_8879,prsc:2|A-5008-XYZ,B-5008-W;n:type:ShaderForge.SFN_MultiplyMatrix,id:1724,x:32758,y:32951,varname:node_1724,prsc:2|A-3656-OUT,B-8879-OUT;n:type:ShaderForge.SFN_Matrix4x4Property,id:3656,x:32590,y:32791,ptovrint:False,ptlb:_Camera2World,ptin:_Camera2World,varname:node_3656,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,m00:1,m01:0,m02:0,m03:0,m10:0,m11:1,m12:0,m13:0,m20:0,m21:0,m22:1,m23:0,m30:0,m31:0,m32:0,m33:1;n:type:ShaderForge.SFN_LightPosition,id:4121,x:32743,y:32791,varname:node_4121,prsc:2;n:type:ShaderForge.SFN_Distance,id:8653,x:32920,y:32791,varname:node_8653,prsc:2|A-4121-XYZ,B-1724-OUT;n:type:ShaderForge.SFN_Power,id:1744,x:33097,y:32791,varname:node_1744,prsc:2|VAL-8653-OUT,EXP-4912-OUT;n:type:ShaderForge.SFN_Subtract,id:2099,x:33258,y:32773,varname:node_2099,prsc:2|A-9876-OUT,B-1744-OUT;n:type:ShaderForge.SFN_Max,id:2538,x:33446,y:32773,varname:node_2538,prsc:2|A-2099-OUT,B-2079-OUT;n:type:ShaderForge.SFN_Vector1,id:2079,x:33242,y:32972,varname:node_2079,prsc:2,v1:0;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:1482,x:33644,y:32773,varname:node_1482,prsc:2|IN-2538-OUT,IMIN-2079-OUT,IMAX-9876-OUT,OMIN-2079-OUT,OMAX-9334-OUT;n:type:ShaderForge.SFN_Vector1,id:9334,x:33306,y:33036,varname:node_9334,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:1091,x:33652,y:32945,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_1091,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:2061,x:33652,y:33124,varname:node_2061,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1167,x:33848,y:32697,varname:node_1167,prsc:2|A-1091-RGB,B-2061-RGB,C-6789-RGB,D-1482-OUT;n:type:ShaderForge.SFN_LightColor,id:6789,x:33644,y:32652,varname:node_6789,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:1679,x:33883,y:32896,ptovrint:False,ptlb:LightClamp,ptin:_LightClamp,varname:node_1679,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Min,id:116,x:34057,y:32697,varname:node_116,prsc:2|A-1167-OUT,B-1679-OUT;n:type:ShaderForge.SFN_Multiply,id:2737,x:34125,y:33001,varname:node_2737,prsc:2|A-1091-A,B-2061-A;n:type:ShaderForge.SFN_ValueProperty,id:4912,x:32920,y:32958,ptovrint:False,ptlb:LightFalloff,ptin:_LightFalloff,varname:node_4912,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:9876,x:33097,y:32720,ptovrint:False,ptlb:LightRange,ptin:_LightRange,varname:node_9876,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1091;pass:END;sub:END;*/

Shader "Shader Forge/litParticleT01" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
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
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float3 finalColor = 0;
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                fixed4 finalRGBA = fixed4(finalColor,(_MainTexture_var.a*i.vertexColor.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
