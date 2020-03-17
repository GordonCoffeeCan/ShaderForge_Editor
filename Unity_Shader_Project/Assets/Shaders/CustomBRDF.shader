// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33241,y:32419,varname:node_9361,prsc:2|custl-8541-RGB;n:type:ShaderForge.SFN_LightVector,id:7533,x:32239,y:32921,varname:node_7533,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:3386,x:32432,y:33056,varname:node_3386,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:3102,x:32068,y:32595,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:3296,x:32432,y:32829,varname:node_3296,prsc:2,dt:1|A-3102-OUT,B-7533-OUT;n:type:ShaderForge.SFN_Multiply,id:3156,x:32596,y:32921,varname:node_3156,prsc:2|A-3296-OUT,B-3386-OUT;n:type:ShaderForge.SFN_Tex2d,id:8541,x:32876,y:32662,ptovrint:False,ptlb:BRDFTexture,ptin:_BRDFTexture,varname:node_8541,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6e2b52bdc3b82244ea889c03c2e1bb1f,ntxv:0,isnm:False|UVIN-9655-OUT;n:type:ShaderForge.SFN_Append,id:9655,x:32863,y:32450,varname:node_9655,prsc:2|A-3156-OUT,B-1366-OUT;n:type:ShaderForge.SFN_ViewVector,id:7541,x:32114,y:32337,varname:node_7541,prsc:2;n:type:ShaderForge.SFN_Dot,id:8832,x:32309,y:32444,varname:node_8832,prsc:2,dt:1|A-7541-OUT,B-3102-OUT;n:type:ShaderForge.SFN_Power,id:1366,x:32623,y:32315,varname:node_1366,prsc:2|VAL-8832-OUT,EXP-8806-OUT;n:type:ShaderForge.SFN_Exp,id:8806,x:32596,y:32542,varname:node_8806,prsc:2,et:1|IN-2227-OUT;n:type:ShaderForge.SFN_Slider,id:2227,x:32439,y:32722,ptovrint:False,ptlb:SpecIntensity,ptin:_SpecIntensity,varname:node_2227,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3,max:5;proporder:8541-2227;pass:END;sub:END;*/

Shader "MyShader/CustomBRDF" {
    Properties {
        _BRDFTexture ("BRDFTexture", 2D) = "white" {}
        _SpecIntensity ("SpecIntensity", Range(0, 5)) = 3
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _BRDFTexture; uniform float4 _BRDFTexture_ST;
            uniform float _SpecIntensity;
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
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_9655 = float2((max(0,dot(i.normalDir,lightDirection))*attenuation),pow(max(0,dot(viewDirection,i.normalDir)),exp2(_SpecIntensity)));
                float4 _BRDFTexture_var = tex2D(_BRDFTexture,TRANSFORM_TEX(node_9655, _BRDFTexture));
                float3 finalColor = _BRDFTexture_var.rgb;
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
            uniform sampler2D _BRDFTexture; uniform float4 _BRDFTexture_ST;
            uniform float _SpecIntensity;
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
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_9655 = float2((max(0,dot(i.normalDir,lightDirection))*attenuation),pow(max(0,dot(viewDirection,i.normalDir)),exp2(_SpecIntensity)));
                float4 _BRDFTexture_var = tex2D(_BRDFTexture,TRANSFORM_TEX(node_9655, _BRDFTexture));
                float3 finalColor = _BRDFTexture_var.rgb;
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
