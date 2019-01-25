// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33476,y:32655,varname:node_3138,prsc:2|custl-2411-RGB;n:type:ShaderForge.SFN_Tex2d,id:2411,x:33207,y:32756,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_2411,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7d1c1adfd77b3c743bb7973ac33d4f88,ntxv:0,isnm:False|UVIN-3764-OUT;n:type:ShaderForge.SFN_TexCoord,id:456,x:32299,y:32822,varname:node_456,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:2441,x:31649,y:32964,ptovrint:False,ptlb:U_Velocity,ptin:_U_Velocity,varname:node_2441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Slider,id:442,x:31649,y:33308,ptovrint:False,ptlb:V_Velocity,ptin:_V_Velocity,varname:_node_2441_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Time,id:774,x:31806,y:33099,varname:node_774,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9757,x:32068,y:33013,varname:node_9757,prsc:2|A-2441-OUT,B-774-T;n:type:ShaderForge.SFN_Multiply,id:7767,x:32068,y:33254,varname:node_7767,prsc:2|A-774-T,B-442-OUT;n:type:ShaderForge.SFN_Append,id:9839,x:32297,y:33121,varname:node_9839,prsc:2|A-9757-OUT,B-7767-OUT;n:type:ShaderForge.SFN_Add,id:5591,x:32490,y:33022,varname:node_5591,prsc:2|A-456-UVOUT,B-9839-OUT;n:type:ShaderForge.SFN_Tex2d,id:4622,x:32702,y:33206,ptovrint:False,ptlb:Water_Noise,ptin:_Water_Noise,varname:node_4622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:37cf3598abfc911459f3d78d5f0d751a,ntxv:0,isnm:False|UVIN-5591-OUT;n:type:ShaderForge.SFN_ComponentMask,id:3414,x:32968,y:33164,varname:node_3414,prsc:2,cc1:0,cc2:0,cc3:-1,cc4:-1|IN-4622-RGB;n:type:ShaderForge.SFN_Add,id:3764,x:32923,y:32767,varname:node_3764,prsc:2|A-456-UVOUT,B-8682-OUT;n:type:ShaderForge.SFN_Multiply,id:8682,x:32940,y:32931,varname:node_8682,prsc:2|A-3414-OUT,B-4504-OUT;n:type:ShaderForge.SFN_Slider,id:4504,x:33077,y:33000,ptovrint:False,ptlb:node_4504,ptin:_node_4504,varname:node_4504,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.25,max:0.5;proporder:2411-2441-442-4622-4504;pass:END;sub:END;*/

Shader "MyShader/CustomUVAnim" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _U_Velocity ("U_Velocity", Range(0, 1)) = 0.1
        _V_Velocity ("V_Velocity", Range(0, 1)) = 0.1
        _Water_Noise ("Water_Noise", 2D) = "white" {}
        _node_4504 ("node_4504", Range(0, 0.5)) = 0.25
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            uniform float _U_Velocity;
            uniform float _V_Velocity;
            uniform sampler2D _Water_Noise; uniform float4 _Water_Noise_ST;
            uniform float _node_4504;
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
                float4 node_774 = _Time;
                float2 node_5591 = (i.uv0+float2((_U_Velocity*node_774.g),(node_774.g*_V_Velocity)));
                float4 _Water_Noise_var = tex2D(_Water_Noise,TRANSFORM_TEX(node_5591, _Water_Noise));
                float2 node_3764 = (i.uv0+(_Water_Noise_var.rgb.rr*_node_4504));
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_3764, _Texture));
                float3 finalColor = _Texture_var.rgb;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
