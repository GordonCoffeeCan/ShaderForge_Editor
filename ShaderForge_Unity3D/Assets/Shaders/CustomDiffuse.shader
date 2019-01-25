// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:34141,y:32493,varname:node_9361,prsc:2|normal-7547-RGB,custl-8481-OUT;n:type:ShaderForge.SFN_LightVector,id:9266,x:32478,y:32616,varname:node_9266,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:4766,x:32478,y:32451,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:8265,x:32710,y:32516,varname:node_8265,prsc:2,dt:1|A-4766-OUT,B-9266-OUT;n:type:ShaderForge.SFN_Tex2d,id:8807,x:32612,y:33085,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_8807,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9824,x:33147,y:32688,varname:node_9824,prsc:2|A-8265-OUT,B-8997-OUT;n:type:ShaderForge.SFN_Color,id:4049,x:32866,y:33270,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_4049,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8997,x:32866,y:33085,varname:node_8997,prsc:2|A-8807-RGB,B-4049-RGB;n:type:ShaderForge.SFN_HalfVector,id:5152,x:32447,y:32211,varname:node_5152,prsc:2;n:type:ShaderForge.SFN_Dot,id:3261,x:32783,y:32263,varname:node_3261,prsc:2,dt:1|A-5152-OUT,B-4766-OUT;n:type:ShaderForge.SFN_Power,id:1300,x:33140,y:32180,varname:node_1300,prsc:2|VAL-3261-OUT,EXP-144-OUT;n:type:ShaderForge.SFN_Exp,id:144,x:33094,y:32328,varname:node_144,prsc:2,et:1|IN-173-OUT;n:type:ShaderForge.SFN_Slider,id:173,x:32948,y:32503,ptovrint:False,ptlb:SpecRange,ptin:_SpecRange,varname:node_173,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:10;n:type:ShaderForge.SFN_Add,id:3972,x:33662,y:32534,varname:node_3972,prsc:2|A-5377-OUT,B-8817-OUT;n:type:ShaderForge.SFN_Slider,id:1533,x:33375,y:32198,ptovrint:False,ptlb:SpecIntensity,ptin:_SpecIntensity,varname:node_1533,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:10;n:type:ShaderForge.SFN_Multiply,id:5994,x:33504,y:32037,varname:node_5994,prsc:2|A-1300-OUT,B-1533-OUT;n:type:ShaderForge.SFN_Desaturate,id:388,x:32629,y:32904,varname:node_388,prsc:2|COL-8807-RGB;n:type:ShaderForge.SFN_RemapRange,id:4273,x:32807,y:32904,varname:node_4273,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:2|IN-388-OUT;n:type:ShaderForge.SFN_Clamp01,id:1495,x:32995,y:32904,varname:node_1495,prsc:2|IN-4273-OUT;n:type:ShaderForge.SFN_Multiply,id:5377,x:33434,y:32406,varname:node_5377,prsc:2|A-5994-OUT,B-1495-OUT;n:type:ShaderForge.SFN_Tex2d,id:7547,x:33690,y:32321,ptovrint:False,ptlb:node_7547,ptin:_node_7547,varname:node_7547,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_LightColor,id:3044,x:33674,y:32804,varname:node_3044,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:2566,x:33834,y:32895,varname:node_2566,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8481,x:33864,y:32641,varname:node_8481,prsc:2|A-3972-OUT,B-3044-RGB,C-2566-OUT;n:type:ShaderForge.SFN_Fresnel,id:6039,x:33197,y:32922,varname:node_6039,prsc:2|EXP-1604-OUT;n:type:ShaderForge.SFN_Slider,id:1604,x:33064,y:33111,ptovrint:False,ptlb:FresnelIntensity,ptin:_FresnelIntensity,varname:node_1604,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:5,max:10;n:type:ShaderForge.SFN_Multiply,id:2458,x:33382,y:32784,varname:node_2458,prsc:2|A-9824-OUT,B-6039-OUT;n:type:ShaderForge.SFN_Add,id:8817,x:33445,y:32588,varname:node_8817,prsc:2|A-9824-OUT,B-2458-OUT;proporder:4049-8807-7547-173-1533-1604;pass:END;sub:END;*/

Shader "MyShader/CustomDiffuse" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Texture ("Texture", 2D) = "white" {}
        _node_7547 ("node_7547", 2D) = "bump" {}
        _SpecRange ("SpecRange", Range(0, 10)) = 5
        _SpecIntensity ("SpecIntensity", Range(0, 10)) = 5
        _FresnelIntensity ("FresnelIntensity", Range(1, 10)) = 5
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float4 _Color;
            uniform float _SpecRange;
            uniform float _SpecIntensity;
            uniform sampler2D _node_7547; uniform float4 _node_7547_ST;
            uniform float _FresnelIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_7547_var = UnpackNormal(tex2D(_node_7547,TRANSFORM_TEX(i.uv0, _node_7547)));
                float3 normalLocal = _node_7547_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 node_9824 = (max(0,dot(normalDirection,lightDirection))*(_Texture_var.rgb*_Color.rgb));
                float3 finalColor = ((((pow(max(0,dot(halfDirection,normalDirection)),exp2(_SpecRange))*_SpecIntensity)*saturate((dot(_Texture_var.rgb,float3(0.3,0.59,0.11))*4.0+-2.0)))+(node_9824+(node_9824*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelIntensity))))*_LightColor0.rgb*attenuation);
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float4 _Color;
            uniform float _SpecRange;
            uniform float _SpecIntensity;
            uniform sampler2D _node_7547; uniform float4 _node_7547_ST;
            uniform float _FresnelIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_7547_var = UnpackNormal(tex2D(_node_7547,TRANSFORM_TEX(i.uv0, _node_7547)));
                float3 normalLocal = _node_7547_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 node_9824 = (max(0,dot(normalDirection,lightDirection))*(_Texture_var.rgb*_Color.rgb));
                float3 finalColor = ((((pow(max(0,dot(halfDirection,normalDirection)),exp2(_SpecRange))*_SpecIntensity)*saturate((dot(_Texture_var.rgb,float3(0.3,0.59,0.11))*4.0+-2.0)))+(node_9824+(node_9824*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelIntensity))))*_LightColor0.rgb*attenuation);
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
