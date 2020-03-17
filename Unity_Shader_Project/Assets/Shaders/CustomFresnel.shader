// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-6692-OUT;n:type:ShaderForge.SFN_Fresnel,id:7976,x:32462,y:32778,varname:node_7976,prsc:2|NRM-7569-OUT,EXP-9145-OUT;n:type:ShaderForge.SFN_NormalVector,id:7569,x:32214,y:32654,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:9145,x:32057,y:32897,ptovrint:False,ptlb:node_9145,ptin:_node_9145,varname:node_9145,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:5,max:10;n:type:ShaderForge.SFN_Color,id:1289,x:32462,y:32942,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1289,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:7501,x:32662,y:32861,varname:node_7501,prsc:2|A-7976-OUT,B-1289-RGB,C-6469-OUT;n:type:ShaderForge.SFN_Tex2d,id:4908,x:32662,y:32608,ptovrint:False,ptlb:node_4908,ptin:_node_4908,varname:node_4908,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:6692,x:32908,y:32724,varname:node_6692,prsc:2|A-4908-RGB,B-7501-OUT;n:type:ShaderForge.SFN_Slider,id:6469,x:32305,y:33126,ptovrint:False,ptlb:node_6469,ptin:_node_6469,varname:node_6469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:5,max:10;proporder:9145-1289-4908-6469;pass:END;sub:END;*/

Shader "MyShader/CustomFresnel" {
    Properties {
        _node_9145 ("node_9145", Range(1, 10)) = 5
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _node_4908 ("node_4908", 2D) = "white" {}
        _node_6469 ("node_6469", Range(1, 10)) = 5
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
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _node_9145;
            uniform float4 _Color;
            uniform sampler2D _node_4908; uniform float4 _node_4908_ST;
            uniform float _node_6469;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _node_4908_var = tex2D(_node_4908,TRANSFORM_TEX(i.uv0, _node_4908));
                float3 emissive = (_node_4908_var.rgb+(pow(1.0-max(0,dot(i.normalDir, viewDirection)),_node_9145)*_Color.rgb*_node_6469));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
