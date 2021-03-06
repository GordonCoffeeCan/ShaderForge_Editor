// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.05,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33672,y:32770,varname:node_9361,prsc:2|emission-773-OUT;n:type:ShaderForge.SFN_Tex2d,id:5610,x:32400,y:32671,ptovrint:False,ptlb:node_5610,ptin:_node_5610,varname:node_5610,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b6938f7e8f4329c40aaedacb20f834c2,ntxv:0,isnm:False|UVIN-3926-UVOUT;n:type:ShaderForge.SFN_Panner,id:3926,x:32205,y:32671,varname:node_3926,prsc:2,spu:0,spv:0.1|UVIN-2622-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2622,x:31837,y:32802,varname:node_2622,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2906,x:33034,y:33028,varname:node_2906,prsc:2|A-4376-OUT,B-8343-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7575,x:33242,y:33028,ptovrint:False,ptlb:node_7575,ptin:_node_7575,varname:node_7575,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1af45cacbc75a3245b2546bbd8079c97,ntxv:0,isnm:False|UVIN-2906-OUT;n:type:ShaderForge.SFN_Multiply,id:4376,x:32978,y:32729,varname:node_4376,prsc:2|A-9463-OUT,B-8135-OUT;n:type:ShaderForge.SFN_Slider,id:9463,x:32184,y:32485,ptovrint:False,ptlb:node_9463,ptin:_node_9463,varname:node_9463,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:250,x:32402,y:32923,ptovrint:False,ptlb:node_5610_copy,ptin:_node_5610_copy,varname:_node_5610_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:87a9c25a75c34c146b94fda20fa43750,ntxv:0,isnm:False|UVIN-117-UVOUT;n:type:ShaderForge.SFN_Panner,id:117,x:32205,y:32923,varname:node_117,prsc:2,spu:0,spv:0.1|UVIN-2622-UVOUT;n:type:ShaderForge.SFN_Panner,id:8343,x:32214,y:33183,varname:node_8343,prsc:2,spu:0,spv:0.1|UVIN-2622-UVOUT;n:type:ShaderForge.SFN_Add,id:8135,x:32650,y:32818,varname:node_8135,prsc:2|A-5610-R,B-250-R;n:type:ShaderForge.SFN_Color,id:5704,x:33242,y:32832,ptovrint:False,ptlb:node_5704,ptin:_node_5704,varname:node_5704,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:773,x:33435,y:32934,varname:node_773,prsc:2|A-5704-RGB,B-7575-RGB;proporder:5610-7575-9463-250-5704;pass:END;sub:END;*/

Shader "MyShader/CustomEmissionTexture" {
    Properties {
        _node_5610 ("node_5610", 2D) = "white" {}
        _node_7575 ("node_7575", 2D) = "white" {}
        _node_9463 ("node_9463", Range(0, 1)) = 0
        _node_5610_copy ("node_5610_copy", 2D) = "white" {}
        [HDR]_node_5704 ("node_5704", Color) = (0.5,0.5,0.5,1)
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
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_5610; uniform float4 _node_5610_ST;
            uniform sampler2D _node_7575; uniform float4 _node_7575_ST;
            uniform float _node_9463;
            uniform sampler2D _node_5610_copy; uniform float4 _node_5610_copy_ST;
            uniform float4 _node_5704;
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
////// Lighting:
////// Emissive:
                float4 node_1856 = _Time;
                float2 node_3926 = (i.uv0+node_1856.g*float2(0,0.1));
                float4 _node_5610_var = tex2D(_node_5610,TRANSFORM_TEX(node_3926, _node_5610));
                float2 node_117 = (i.uv0+node_1856.g*float2(0,0.1));
                float4 _node_5610_copy_var = tex2D(_node_5610_copy,TRANSFORM_TEX(node_117, _node_5610_copy));
                float2 node_2906 = ((_node_9463*(_node_5610_var.r+_node_5610_copy_var.r))+(i.uv0+node_1856.g*float2(0,0.1)));
                float4 _node_7575_var = tex2D(_node_7575,TRANSFORM_TEX(node_2906, _node_7575));
                float3 emissive = (_node_5704.rgb*_node_7575_var.rgb);
                float3 finalColor = emissive;
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
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
