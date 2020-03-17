// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33367,y:32672,varname:node_9361,prsc:2|custl-453-OUT,olwid-7215-OUT;n:type:ShaderForge.SFN_NormalVector,id:4681,x:32167,y:32698,prsc:2,pt:False;n:type:ShaderForge.SFN_LightAttenuation,id:7582,x:32353,y:33006,varname:node_7582,prsc:2;n:type:ShaderForge.SFN_LightVector,id:4449,x:32167,y:32888,varname:node_4449,prsc:2;n:type:ShaderForge.SFN_Dot,id:9778,x:32353,y:32779,varname:node_9778,prsc:2,dt:1|A-4681-OUT,B-4449-OUT;n:type:ShaderForge.SFN_Tex2d,id:8928,x:32892,y:32857,ptovrint:False,ptlb:ToonDiffuseTexture,ptin:_ToonDiffuseTexture,varname:node_8928,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e5433aafad9441c4998914efc0d20948,ntxv:0,isnm:False|UVIN-5524-OUT;n:type:ShaderForge.SFN_Append,id:5524,x:32717,y:32780,varname:node_5524,prsc:2|A-7168-OUT,B-7168-OUT;n:type:ShaderForge.SFN_Multiply,id:7168,x:32551,y:32885,varname:node_7168,prsc:2|A-9778-OUT,B-7582-OUT;n:type:ShaderForge.SFN_Slider,id:6391,x:32576,y:33131,ptovrint:False,ptlb:Outline_Width,ptin:_Outline_Width,varname:node_6391,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:5,max:10;n:type:ShaderForge.SFN_HalfVector,id:1612,x:32167,y:32467,varname:node_1612,prsc:2;n:type:ShaderForge.SFN_Dot,id:5171,x:32374,y:32549,varname:node_5171,prsc:2,dt:1|A-1612-OUT,B-4681-OUT;n:type:ShaderForge.SFN_Tex2d,id:1144,x:32892,y:32609,ptovrint:False,ptlb:ToonSpecTexture,ptin:_ToonSpecTexture,varname:node_1144,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:836f6f6e2ef5cd34a969b8c52d47a49e,ntxv:0,isnm:False|UVIN-2693-OUT;n:type:ShaderForge.SFN_Append,id:2693,x:32577,y:32539,varname:node_2693,prsc:2|A-5171-OUT,B-5171-OUT;n:type:ShaderForge.SFN_Add,id:453,x:33111,y:32734,varname:node_453,prsc:2|A-1144-RGB,B-8928-RGB;n:type:ShaderForge.SFN_RemapRange,id:7215,x:33007,y:33103,varname:node_7215,prsc:2,frmn:1,frmx:10,tomn:0,tomx:0.05|IN-6391-OUT;proporder:8928-6391-1144;pass:END;sub:END;*/

Shader "MyShader/CustomToon" {
    Properties {
        _ToonDiffuseTexture ("ToonDiffuseTexture", 2D) = "white" {}
        _Outline_Width ("Outline_Width", Range(1, 10)) = 5
        _ToonSpecTexture ("ToonSpecTexture", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Outline_Width;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_FOG_COORDS(0)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*(_Outline_Width*0.005555556+-0.005555556),1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(float3(0,0,0),0);
            }
            ENDCG
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _ToonDiffuseTexture; uniform float4 _ToonDiffuseTexture_ST;
            uniform sampler2D _ToonSpecTexture; uniform float4 _ToonSpecTexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float node_5171 = max(0,dot(halfDirection,i.normalDir));
                float2 node_2693 = float2(node_5171,node_5171);
                float4 _ToonSpecTexture_var = tex2D(_ToonSpecTexture,TRANSFORM_TEX(node_2693, _ToonSpecTexture));
                float node_7168 = (max(0,dot(i.normalDir,lightDirection))*attenuation);
                float2 node_5524 = float2(node_7168,node_7168);
                float4 _ToonDiffuseTexture_var = tex2D(_ToonDiffuseTexture,TRANSFORM_TEX(node_5524, _ToonDiffuseTexture));
                float3 finalColor = (_ToonSpecTexture_var.rgb+_ToonDiffuseTexture_var.rgb);
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _ToonDiffuseTexture; uniform float4 _ToonDiffuseTexture_ST;
            uniform sampler2D _ToonSpecTexture; uniform float4 _ToonSpecTexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float node_5171 = max(0,dot(halfDirection,i.normalDir));
                float2 node_2693 = float2(node_5171,node_5171);
                float4 _ToonSpecTexture_var = tex2D(_ToonSpecTexture,TRANSFORM_TEX(node_2693, _ToonSpecTexture));
                float node_7168 = (max(0,dot(i.normalDir,lightDirection))*attenuation);
                float2 node_5524 = float2(node_7168,node_7168);
                float4 _ToonDiffuseTexture_var = tex2D(_ToonDiffuseTexture,TRANSFORM_TEX(node_5524, _ToonDiffuseTexture));
                float3 finalColor = (_ToonSpecTexture_var.rgb+_ToonDiffuseTexture_var.rgb);
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
