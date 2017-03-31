// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33195,y:32390,varname:node_9361,prsc:2|custl-9673-OUT;n:type:ShaderForge.SFN_ScreenPos,id:6767,x:32105,y:32779,varname:node_6767,prsc:2,sctp:0;n:type:ShaderForge.SFN_SceneColor,id:492,x:32664,y:32901,varname:node_492,prsc:2|UVIN-9025-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:3115,x:32281,y:32779,varname:node_3115,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6767-UVOUT;n:type:ShaderForge.SFN_Parallax,id:9025,x:32496,y:32821,varname:node_9025,prsc:2|UVIN-3115-OUT,HEI-3595-OUT,DEP-6677-OUT,REF-310-OUT;n:type:ShaderForge.SFN_Slider,id:3595,x:32253,y:33036,ptovrint:False,ptlb:Hei,ptin:_Hei,varname:node_3595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:6677,x:32253,y:33138,ptovrint:False,ptlb:Dep,ptin:_Dep,varname:_node_3595_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:310,x:32253,y:33238,ptovrint:False,ptlb:Ref,ptin:_Ref,varname:_node_3595_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_LightVector,id:7941,x:32067,y:32292,varname:node_7941,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:9557,x:32067,y:32436,varname:node_9557,prsc:2;n:type:ShaderForge.SFN_Dot,id:3654,x:32251,y:32355,varname:node_3654,prsc:2,dt:1|A-7941-OUT,B-9557-OUT;n:type:ShaderForge.SFN_Power,id:2959,x:32499,y:32355,varname:node_2959,prsc:2|VAL-3654-OUT,EXP-6567-OUT;n:type:ShaderForge.SFN_Exp,id:6567,x:32251,y:32526,varname:node_6567,prsc:2,et:0|IN-880-OUT;n:type:ShaderForge.SFN_Slider,id:880,x:31867,y:32634,ptovrint:False,ptlb:Spacular Gloss,ptin:_SpacularGloss,varname:node_880,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.1,max:10;n:type:ShaderForge.SFN_Multiply,id:3130,x:32739,y:32390,varname:node_3130,prsc:2|A-2959-OUT,B-5082-OUT;n:type:ShaderForge.SFN_Slider,id:5082,x:32465,y:32592,ptovrint:False,ptlb:Specular Intensity,ptin:_SpecularIntensity,varname:node_5082,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:9673,x:32999,y:32586,varname:node_9673,prsc:2|A-3130-OUT,B-492-RGB;proporder:3595-6677-310-880-5082;pass:END;sub:END;*/

Shader "Shader Forge/Transparent" {
    Properties {
        _Hei ("Hei", Range(0, 1)) = 0
        _Dep ("Dep", Range(0, 1)) = 0
        _Ref ("Ref", Range(0, 1)) = 0
        _SpacularGloss ("Spacular Gloss", Range(0.1, 10)) = 0.1
        _SpecularIntensity ("Specular Intensity", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
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
            uniform sampler2D _GrabTexture;
            uniform float _Hei;
            uniform float _Dep;
            uniform float _Ref;
            uniform float _SpacularGloss;
            uniform float _SpecularIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                float4 screenPos : TEXCOORD4;
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float3 finalColor = ((pow(max(0,dot(lightDirection,viewReflectDirection)),exp(_SpacularGloss))*_SpecularIntensity)+tex2D( _GrabTexture, (_Dep*(_Hei - _Ref)*mul(tangentTransform, viewDirection).xy + (i.screenPos.rg*0.5+0.5)).rg).rgb);
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _Hei;
            uniform float _Dep;
            uniform float _Ref;
            uniform float _SpacularGloss;
            uniform float _SpecularIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                float4 screenPos : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = ((pow(max(0,dot(lightDirection,viewReflectDirection)),exp(_SpacularGloss))*_SpecularIntensity)+tex2D( _GrabTexture, (_Dep*(_Hei - _Ref)*mul(tangentTransform, viewDirection).xy + (i.screenPos.rg*0.5+0.5)).rg).rgb);
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
