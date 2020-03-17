// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-3627-RGB,custl-9211-OUT,clip-4137-A;n:type:ShaderForge.SFN_Tex2d,id:3842,x:32625,y:32700,ptovrint:False,ptlb:Albedo,ptin:_Albedo,varname:node_3842,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1687-OUT;n:type:ShaderForge.SFN_Color,id:8450,x:32625,y:32911,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_8450,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9211,x:32909,y:32806,varname:node_9211,prsc:2|A-3842-RGB,B-8450-RGB;n:type:ShaderForge.SFN_TexCoord,id:2961,x:31534,y:32410,varname:node_2961,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:9247,x:31805,y:32537,varname:node_9247,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2961-UVOUT;n:type:ShaderForge.SFN_Time,id:7039,x:31324,y:32721,varname:node_7039,prsc:2;n:type:ShaderForge.SFN_Slider,id:7445,x:31462,y:33112,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_7445,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_ValueProperty,id:323,x:31541,y:32983,ptovrint:False,ptlb:Speed_Multiplier,ptin:_Speed_Multiplier,varname:node_323,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:444,x:31819,y:33034,varname:node_444,prsc:2|A-323-OUT,B-7445-OUT;n:type:ShaderForge.SFN_Multiply,id:2860,x:31819,y:32825,varname:node_2860,prsc:2|A-9621-OUT,B-444-OUT;n:type:ShaderForge.SFN_Multiply,id:9621,x:31534,y:32636,varname:node_9621,prsc:2|A-1502-OUT,B-7039-T;n:type:ShaderForge.SFN_Add,id:4568,x:32005,y:32699,varname:node_4568,prsc:2|A-9247-G,B-2860-OUT;n:type:ShaderForge.SFN_Append,id:1687,x:32217,y:32617,varname:node_1687,prsc:2|A-9247-R,B-4568-OUT;n:type:ShaderForge.SFN_Vector1,id:1502,x:31324,y:32620,varname:node_1502,prsc:2,v1:-1;n:type:ShaderForge.SFN_Tex2d,id:3627,x:32625,y:32467,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:_Albedo_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1687-OUT;n:type:ShaderForge.SFN_Tex2d,id:4137,x:32625,y:33110,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:_Emission_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1687-OUT;proporder:8450-3842-4137-3627-323-7445;pass:END;sub:END;*/

Shader "CVR_VFX_Shaders/CVR_V_Panning" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Albedo ("Albedo", 2D) = "white" {}
        _Alpha ("Alpha", 2D) = "white" {}
        _Emission ("Emission", 2D) = "white" {}
        _Speed_Multiplier ("Speed_Multiplier", Float ) = 1
        _Speed ("Speed", Range(0, 1)) = 0.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            uniform float4 _Color;
            uniform float _Speed;
            uniform float _Speed_Multiplier;
            uniform sampler2D _Emission; uniform float4 _Emission_ST;
            uniform sampler2D _Alpha; uniform float4 _Alpha_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float2 node_9247 = i.uv0.rg;
                float4 node_7039 = _Time;
                float2 node_1687 = float2(node_9247.r,(node_9247.g+(((-1.0)*node_7039.g)*(_Speed_Multiplier*_Speed))));
                float4 _Alpha_var = tex2D(_Alpha,TRANSFORM_TEX(node_1687, _Alpha));
                clip(_Alpha_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 _Emission_var = tex2D(_Emission,TRANSFORM_TEX(node_1687, _Emission));
                float3 emissive = _Emission_var.rgb;
                float4 _Albedo_var = tex2D(_Albedo,TRANSFORM_TEX(node_1687, _Albedo));
                float3 finalColor = emissive + (_Albedo_var.rgb*_Color.rgb);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Speed;
            uniform float _Speed_Multiplier;
            uniform sampler2D _Alpha; uniform float4 _Alpha_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float2 node_9247 = i.uv0.rg;
                float4 node_7039 = _Time;
                float2 node_1687 = float2(node_9247.r,(node_9247.g+(((-1.0)*node_7039.g)*(_Speed_Multiplier*_Speed))));
                float4 _Alpha_var = tex2D(_Alpha,TRANSFORM_TEX(node_1687, _Alpha));
                clip(_Alpha_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
