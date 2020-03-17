// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33671,y:32815,varname:node_9361,prsc:2|emission-6236-OUT,custl-8364-OUT,alpha-6122-A;n:type:ShaderForge.SFN_Tex2d,id:9584,x:33274,y:32670,ptovrint:False,ptlb:Albedo,ptin:_Albedo,varname:node_9584,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ee87de8f3d9a48499d40e6308185180,ntxv:0,isnm:False|UVIN-8214-OUT;n:type:ShaderForge.SFN_Color,id:1678,x:33250,y:32498,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8364,x:33451,y:32498,varname:node_8364,prsc:2|A-1678-RGB,B-9584-RGB;n:type:ShaderForge.SFN_TexCoord,id:3435,x:31881,y:32503,varname:node_3435,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:9109,x:31922,y:32811,ptovrint:False,ptlb:Nosie,ptin:_Nosie,varname:node_9109,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8c9574dcef955724eb1a127e8895a90d,ntxv:0,isnm:False|UVIN-5473-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6821,x:32119,y:32811,varname:node_6821,prsc:2,cc1:0,cc2:0,cc3:-1,cc4:-1|IN-9109-RGB;n:type:ShaderForge.SFN_Slider,id:1918,x:31910,y:33074,ptovrint:False,ptlb:NosieIntensity,ptin:_NosieIntensity,varname:node_1918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:2302,x:32346,y:32840,varname:node_2302,prsc:2|A-6821-OUT,B-6845-OUT;n:type:ShaderForge.SFN_Add,id:2951,x:32420,y:32665,varname:node_2951,prsc:2|A-3435-UVOUT,B-2302-OUT;n:type:ShaderForge.SFN_Multiply,id:1304,x:32569,y:33197,varname:node_1304,prsc:2|A-6845-OUT,B-5095-OUT;n:type:ShaderForge.SFN_Vector1,id:5095,x:32569,y:33418,varname:node_5095,prsc:2,v1:-0.5;n:type:ShaderForge.SFN_Add,id:2970,x:32969,y:32925,varname:node_2970,prsc:2|A-1975-R,B-1304-OUT;n:type:ShaderForge.SFN_ComponentMask,id:1975,x:32625,y:32914,varname:node_1975,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2951-OUT;n:type:ShaderForge.SFN_Add,id:602,x:32969,y:33112,varname:node_602,prsc:2|A-1975-G,B-1304-OUT;n:type:ShaderForge.SFN_Append,id:8214,x:32912,y:32645,varname:node_8214,prsc:2|A-2970-OUT,B-602-OUT;n:type:ShaderForge.SFN_Tex2d,id:6122,x:33425,y:32988,ptovrint:False,ptlb:AlphaShape,ptin:_AlphaShape,varname:_Albedo_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:53719699c6301af4aafeec3d80ec2b1d,ntxv:0,isnm:False|UVIN-8214-OUT;n:type:ShaderForge.SFN_Add,id:6236,x:33701,y:32437,varname:node_6236,prsc:2|A-3171-RGB,B-8364-OUT,C-8364-OUT;n:type:ShaderForge.SFN_Slider,id:6762,x:31081,y:33075,ptovrint:False,ptlb:ScrollSpeed,ptin:_ScrollSpeed,varname:node_6762,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.2,max:1;n:type:ShaderForge.SFN_Time,id:6345,x:31737,y:33318,varname:node_6345,prsc:2;n:type:ShaderForge.SFN_Vector1,id:6378,x:31316,y:32931,varname:node_6378,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:8136,x:31535,y:32984,varname:node_8136,prsc:2|A-6378-OUT,B-7769-OUT;n:type:ShaderForge.SFN_Add,id:5473,x:31611,y:32761,varname:node_5473,prsc:2|A-3435-UVOUT,B-4897-OUT;n:type:ShaderForge.SFN_Multiply,id:4897,x:31770,y:33015,varname:node_4897,prsc:2|A-8136-OUT,B-6345-T;n:type:ShaderForge.SFN_Tex2d,id:3171,x:32912,y:32438,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_3171,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c1970fdd536af7642a62d44721e49718,ntxv:0,isnm:False|UVIN-5473-OUT;n:type:ShaderForge.SFN_Vector1,id:4810,x:31238,y:33211,varname:node_4810,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Multiply,id:7769,x:31470,y:33226,varname:node_7769,prsc:2|A-6762-OUT,B-4810-OUT;n:type:ShaderForge.SFN_Multiply,id:6845,x:32290,y:33084,varname:node_6845,prsc:2|A-1918-OUT,B-6999-OUT;n:type:ShaderForge.SFN_Vector1,id:6999,x:32040,y:33202,varname:node_6999,prsc:2,v1:0.1;proporder:1678-9584-3171-6122-9109-1918-6762;pass:END;sub:END;*/

Shader "CVR_VFX_Shaders/UnlitPanning&Glowing" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Albedo ("Albedo", 2D) = "white" {}
        _Emission ("Emission", 2D) = "white" {}
        _AlphaShape ("AlphaShape", 2D) = "white" {}
        _Nosie ("Nosie", 2D) = "white" {}
        _NosieIntensity ("NosieIntensity", Range(0, 1)) = 0.5
        _ScrollSpeed ("ScrollSpeed", Range(-1, 1)) = 0.2
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Albedo; uniform float4 _Albedo_ST;
            uniform float4 _Color;
            uniform sampler2D _Nosie; uniform float4 _Nosie_ST;
            uniform float _NosieIntensity;
            uniform sampler2D _AlphaShape; uniform float4 _AlphaShape_ST;
            uniform float _ScrollSpeed;
            uniform sampler2D _Emission; uniform float4 _Emission_ST;
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
////// Lighting:
////// Emissive:
                float4 node_6345 = _Time;
                float2 node_5473 = (i.uv0+(float2(0.0,(_ScrollSpeed*1.5))*node_6345.g));
                float4 _Emission_var = tex2D(_Emission,TRANSFORM_TEX(node_5473, _Emission));
                float4 _Nosie_var = tex2D(_Nosie,TRANSFORM_TEX(node_5473, _Nosie));
                float node_6845 = (_NosieIntensity*0.1);
                float2 node_1975 = (i.uv0+(_Nosie_var.rgb.rr*node_6845)).rg;
                float node_1304 = (node_6845*(-0.5));
                float2 node_8214 = float2((node_1975.r+node_1304),(node_1975.g+node_1304));
                float4 _Albedo_var = tex2D(_Albedo,TRANSFORM_TEX(node_8214, _Albedo));
                float3 node_8364 = (_Color.rgb*_Albedo_var.rgb);
                float3 emissive = (_Emission_var.rgb+node_8364+node_8364);
                float3 finalColor = emissive + node_8364;
                float4 _AlphaShape_var = tex2D(_AlphaShape,TRANSFORM_TEX(node_8214, _AlphaShape));
                return fixed4(finalColor,_AlphaShape_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
