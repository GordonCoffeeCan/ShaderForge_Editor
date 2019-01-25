// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|custl-6599-RGB,clip-6599-A;n:type:ShaderForge.SFN_Tex2d,id:6599,x:32335,y:32758,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_6599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e8e347bcda0fb3242b524389342e7807,ntxv:0,isnm:False|UVIN-1716-UVOUT;n:type:ShaderForge.SFN_UVTile,id:1716,x:32105,y:32758,varname:node_1716,prsc:2|WDT-9319-OUT,HGT-8001-OUT,TILE-9100-OUT;n:type:ShaderForge.SFN_Vector1,id:9319,x:31910,y:32680,varname:node_9319,prsc:2,v1:8;n:type:ShaderForge.SFN_Vector1,id:8001,x:31910,y:32758,varname:node_8001,prsc:2,v1:-8;n:type:ShaderForge.SFN_Time,id:2522,x:31611,y:32888,varname:node_2522,prsc:2;n:type:ShaderForge.SFN_Trunc,id:9100,x:32049,y:32922,varname:node_9100,prsc:2|IN-3586-OUT;n:type:ShaderForge.SFN_Multiply,id:3586,x:31836,y:32922,varname:node_3586,prsc:2|A-2522-T,B-5481-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5481,x:31638,y:33063,ptovrint:False,ptlb:node_5481,ptin:_node_5481,varname:node_5481,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:60;proporder:6599-5481;pass:END;sub:END;*/

Shader "MyShader/CustomSequence" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _node_5481 ("node_5481", Float ) = 60
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _node_5481;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float node_9319 = 8.0;
                float4 node_2522 = _Time;
                float node_9100 = trunc((node_2522.g*_node_5481));
                float2 node_1716_tc_rcp = float2(1.0,1.0)/float2( node_9319, (-8.0) );
                float node_1716_ty = floor(node_9100 * node_1716_tc_rcp.x);
                float node_1716_tx = node_9100 - node_9319 * node_1716_ty;
                float2 node_1716 = (i.uv0 + float2(node_1716_tx, node_1716_ty)) * node_1716_tc_rcp;
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_1716, _Texture));
                clip(_Texture_var.a - 0.5);
////// Lighting:
                float3 finalColor = _Texture_var.rgb;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _node_5481;
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
            float4 frag(VertexOutput i) : COLOR {
                float node_9319 = 8.0;
                float4 node_2522 = _Time;
                float node_9100 = trunc((node_2522.g*_node_5481));
                float2 node_1716_tc_rcp = float2(1.0,1.0)/float2( node_9319, (-8.0) );
                float node_1716_ty = floor(node_9100 * node_1716_tc_rcp.x);
                float node_1716_tx = node_9100 - node_9319 * node_1716_ty;
                float2 node_1716 = (i.uv0 + float2(node_1716_tx, node_1716_ty)) * node_1716_tc_rcp;
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_1716, _Texture));
                clip(_Texture_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
