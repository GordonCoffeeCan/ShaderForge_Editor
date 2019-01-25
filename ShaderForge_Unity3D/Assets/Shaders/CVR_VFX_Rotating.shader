// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33544,y:32572,varname:node_9361,prsc:2|custl-3631-OUT,alpha-9336-R;n:type:ShaderForge.SFN_TexCoord,id:8755,x:31773,y:32799,varname:node_8755,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Rotator,id:6539,x:32074,y:32637,varname:node_6539,prsc:2|UVIN-8755-UVOUT,SPD-3103-OUT;n:type:ShaderForge.SFN_Tex2d,id:8099,x:32313,y:32637,ptovrint:False,ptlb:Alpha1,ptin:_Alpha1,varname:node_8099,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:431b832724ed9a1449068b573036b180,ntxv:0,isnm:False|UVIN-6539-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:3103,x:31755,y:32982,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_3103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7357,x:32074,y:33015,varname:node_7357,prsc:2|A-3103-OUT,B-6166-OUT;n:type:ShaderForge.SFN_Vector1,id:6166,x:31912,y:33078,varname:node_6166,prsc:2,v1:-1;n:type:ShaderForge.SFN_Rotator,id:1356,x:32074,y:32835,varname:node_1356,prsc:2|UVIN-8755-UVOUT,SPD-7357-OUT;n:type:ShaderForge.SFN_Tex2d,id:5578,x:32313,y:32848,ptovrint:False,ptlb:Alpha2,ptin:_Alpha2,varname:node_5578,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7292eef4cf7686443822412034c6aca0,ntxv:0,isnm:False|UVIN-1356-UVOUT;n:type:ShaderForge.SFN_Add,id:2289,x:32764,y:32733,varname:node_2289,prsc:2|A-859-OUT,B-6872-OUT;n:type:ShaderForge.SFN_Blend,id:6872,x:32557,y:32902,varname:node_6872,prsc:2,blmd:10,clmp:True|SRC-62-OUT,DST-5578-RGB;n:type:ShaderForge.SFN_Time,id:7112,x:31700,y:33251,varname:node_7112,prsc:2;n:type:ShaderForge.SFN_Sin,id:62,x:31997,y:33220,varname:node_62,prsc:2|IN-9474-OUT;n:type:ShaderForge.SFN_Blend,id:859,x:32557,y:32693,varname:node_859,prsc:2,blmd:10,clmp:True|SRC-8099-RGB,DST-62-OUT;n:type:ShaderForge.SFN_Multiply,id:9474,x:31735,y:33092,varname:node_9474,prsc:2|A-3103-OUT,B-7112-T;n:type:ShaderForge.SFN_Tex2d,id:9609,x:32545,y:33266,ptovrint:False,ptlb:Alpha3,ptin:_Alpha3,varname:_Alpha3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dc5e9806e6db95443b4d4f1780ee5a6b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Blend,id:1388,x:32953,y:32923,varname:node_1388,prsc:2,blmd:10,clmp:True|SRC-2289-OUT,DST-4003-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9336,x:33160,y:32825,varname:node_9336,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-1388-OUT;n:type:ShaderForge.SFN_Blend,id:4003,x:32725,y:33124,varname:node_4003,prsc:2,blmd:10,clmp:True|SRC-62-OUT,DST-9609-RGB;n:type:ShaderForge.SFN_Color,id:1132,x:32545,y:33500,ptovrint:False,ptlb:Color1,ptin:_Color1,varname:node_1132,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:9967,x:32313,y:32409,ptovrint:False,ptlb:Color2,ptin:_Color2,varname:_Color2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:5798,x:32313,y:32211,ptovrint:False,ptlb:Color3,ptin:_Color3,varname:_Color3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Blend,id:2327,x:32779,y:33392,varname:node_2327,prsc:2,blmd:10,clmp:True|SRC-9609-RGB,DST-1132-RGB;n:type:ShaderForge.SFN_Blend,id:6511,x:32557,y:32465,varname:node_6511,prsc:2,blmd:10,clmp:True|SRC-8099-RGB,DST-9967-RGB;n:type:ShaderForge.SFN_Blend,id:7513,x:32557,y:32228,varname:node_7513,prsc:2,blmd:10,clmp:True|SRC-5578-RGB,DST-5798-RGB;n:type:ShaderForge.SFN_Blend,id:4239,x:32780,y:32353,varname:node_4239,prsc:2,blmd:10,clmp:True|SRC-7513-OUT,DST-6511-OUT;n:type:ShaderForge.SFN_Blend,id:6743,x:33091,y:32583,varname:node_6743,prsc:2,blmd:8,clmp:True|SRC-4239-OUT,DST-2327-OUT;n:type:ShaderForge.SFN_Multiply,id:3631,x:33314,y:32733,varname:node_3631,prsc:2|A-6743-OUT,B-9336-OUT;proporder:1132-9967-5798-8099-5578-9609-3103;pass:END;sub:END;*/

Shader "CVR/CVR_VFX_Rotating" {
    Properties {
        _Color1 ("Color1", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _Color3 ("Color3", Color) = (1,1,1,1)
        _Alpha1 ("Alpha1", 2D) = "white" {}
        _Alpha2 ("Alpha2", 2D) = "white" {}
        _Alpha3 ("Alpha3", 2D) = "white" {}
        _Speed ("Speed", Float ) = 1
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
            uniform sampler2D _Alpha1; uniform float4 _Alpha1_ST;
            uniform float _Speed;
            uniform sampler2D _Alpha2; uniform float4 _Alpha2_ST;
            uniform sampler2D _Alpha3; uniform float4 _Alpha3_ST;
            uniform float4 _Color1;
            uniform float4 _Color2;
            uniform float4 _Color3;
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
                float4 node_2613 = _Time;
                float node_1356_ang = node_2613.g;
                float node_1356_spd = (_Speed*(-1.0));
                float node_1356_cos = cos(node_1356_spd*node_1356_ang);
                float node_1356_sin = sin(node_1356_spd*node_1356_ang);
                float2 node_1356_piv = float2(0.5,0.5);
                float2 node_1356 = (mul(i.uv0-node_1356_piv,float2x2( node_1356_cos, -node_1356_sin, node_1356_sin, node_1356_cos))+node_1356_piv);
                float4 _Alpha2_var = tex2D(_Alpha2,TRANSFORM_TEX(node_1356, _Alpha2));
                float node_6539_ang = node_2613.g;
                float node_6539_spd = _Speed;
                float node_6539_cos = cos(node_6539_spd*node_6539_ang);
                float node_6539_sin = sin(node_6539_spd*node_6539_ang);
                float2 node_6539_piv = float2(0.5,0.5);
                float2 node_6539 = (mul(i.uv0-node_6539_piv,float2x2( node_6539_cos, -node_6539_sin, node_6539_sin, node_6539_cos))+node_6539_piv);
                float4 _Alpha1_var = tex2D(_Alpha1,TRANSFORM_TEX(node_6539, _Alpha1));
                float4 _Alpha3_var = tex2D(_Alpha3,TRANSFORM_TEX(i.uv0, _Alpha3));
                float4 node_7112 = _Time;
                float node_62 = sin((_Speed*node_7112.g));
                float3 node_9336 = saturate(( saturate(( _Alpha3_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Alpha3_var.rgb-0.5))*(1.0-node_62)) : (2.0*_Alpha3_var.rgb*node_62) )) > 0.5 ? (1.0-(1.0-2.0*(saturate(( _Alpha3_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Alpha3_var.rgb-0.5))*(1.0-node_62)) : (2.0*_Alpha3_var.rgb*node_62) ))-0.5))*(1.0-(saturate(( node_62 > 0.5 ? (1.0-(1.0-2.0*(node_62-0.5))*(1.0-_Alpha1_var.rgb)) : (2.0*node_62*_Alpha1_var.rgb) ))+saturate(( _Alpha2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Alpha2_var.rgb-0.5))*(1.0-node_62)) : (2.0*_Alpha2_var.rgb*node_62) ))))) : (2.0*saturate(( _Alpha3_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Alpha3_var.rgb-0.5))*(1.0-node_62)) : (2.0*_Alpha3_var.rgb*node_62) ))*(saturate(( node_62 > 0.5 ? (1.0-(1.0-2.0*(node_62-0.5))*(1.0-_Alpha1_var.rgb)) : (2.0*node_62*_Alpha1_var.rgb) ))+saturate(( _Alpha2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Alpha2_var.rgb-0.5))*(1.0-node_62)) : (2.0*_Alpha2_var.rgb*node_62) )))) )).rgb;
                float3 finalColor = (saturate((saturate(( saturate(( _Color2.rgb > 0.5 ? (1.0-(1.0-2.0*(_Color2.rgb-0.5))*(1.0-_Alpha1_var.rgb)) : (2.0*_Color2.rgb*_Alpha1_var.rgb) )) > 0.5 ? (1.0-(1.0-2.0*(saturate(( _Color2.rgb > 0.5 ? (1.0-(1.0-2.0*(_Color2.rgb-0.5))*(1.0-_Alpha1_var.rgb)) : (2.0*_Color2.rgb*_Alpha1_var.rgb) ))-0.5))*(1.0-saturate(( _Color3.rgb > 0.5 ? (1.0-(1.0-2.0*(_Color3.rgb-0.5))*(1.0-_Alpha2_var.rgb)) : (2.0*_Color3.rgb*_Alpha2_var.rgb) )))) : (2.0*saturate(( _Color2.rgb > 0.5 ? (1.0-(1.0-2.0*(_Color2.rgb-0.5))*(1.0-_Alpha1_var.rgb)) : (2.0*_Color2.rgb*_Alpha1_var.rgb) ))*saturate(( _Color3.rgb > 0.5 ? (1.0-(1.0-2.0*(_Color3.rgb-0.5))*(1.0-_Alpha2_var.rgb)) : (2.0*_Color3.rgb*_Alpha2_var.rgb) ))) ))+saturate(( _Color1.rgb > 0.5 ? (1.0-(1.0-2.0*(_Color1.rgb-0.5))*(1.0-_Alpha3_var.rgb)) : (2.0*_Color1.rgb*_Alpha3_var.rgb) ))))*node_9336);
                fixed4 finalRGBA = fixed4(finalColor,node_9336.r);
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
