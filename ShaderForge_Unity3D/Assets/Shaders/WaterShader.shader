// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33121,y:32659,varname:node_4013,prsc:2|diff-4736-RGB,alpha-4711-OUT,refract-2007-OUT;n:type:ShaderForge.SFN_Tex2d,id:2529,x:32514,y:33046,ptovrint:False,ptlb:Refraction Noise,ptin:_RefractionNoise,varname:node_2529,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-9255-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:2812,x:32678,y:33155,varname:node_2812,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2529-RGB;n:type:ShaderForge.SFN_Slider,id:8231,x:32657,y:33317,ptovrint:False,ptlb:Refraction,ptin:_Refraction,varname:node_8231,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:2007,x:32923,y:33125,varname:node_2007,prsc:2|A-2812-OUT,B-8231-OUT;n:type:ShaderForge.SFN_Slider,id:4711,x:32691,y:32899,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:_Refraction_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Panner,id:9255,x:32487,y:33222,varname:node_9255,prsc:2,spu:-0.005,spv:-0.005|UVIN-4287-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4287,x:32293,y:33222,varname:node_4287,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:4736,x:32736,y:32653,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_4736,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-9406-OUT;n:type:ShaderForge.SFN_TexCoord,id:8989,x:32030,y:32585,varname:node_8989,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:4210,x:32255,y:32600,varname:node_4210,prsc:2,spu:-0.005,spv:-0.005|UVIN-8989-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9406,x:32523,y:32692,varname:node_9406,prsc:2|A-4210-UVOUT,B-8351-OUT;n:type:ShaderForge.SFN_Tex2d,id:2770,x:32032,y:32838,ptovrint:False,ptlb:Albedo Texture Noise,ptin:_AlbedoTextureNoise,varname:_TextureNoise_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:8351,x:32234,y:32838,varname:node_8351,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2770-RGB;proporder:4736-4711-2770-2529-8231;pass:END;sub:END;*/

Shader "WaterShader" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Opacity ("Opacity", Range(0, 1)) = 0.5
        _AlbedoTextureNoise ("Albedo Texture Noise", 2D) = "white" {}
        _RefractionNoise ("Refraction Noise", 2D) = "white" {}
        _Refraction ("Refraction", Range(-1, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform sampler2D _RefractionNoise; uniform float4 _RefractionNoise_ST;
            uniform float _Refraction;
            uniform float _Opacity;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _AlbedoTextureNoise; uniform float4 _AlbedoTextureNoise_ST;
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
                float4 projPos : TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float4 node_8965 = _Time;
                float2 node_9255 = (i.uv0+node_8965.g*float2(-0.005,-0.005));
                float4 _RefractionNoise_var = tex2D(_RefractionNoise,TRANSFORM_TEX(node_9255, _RefractionNoise));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (_RefractionNoise_var.rgb.rg*_Refraction);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _AlbedoTextureNoise_var = tex2D(_AlbedoTextureNoise,TRANSFORM_TEX(i.uv0, _AlbedoTextureNoise));
                float2 node_9406 = ((i.uv0+node_8965.g*float2(-0.005,-0.005))*_AlbedoTextureNoise_var.rgb.rg);
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_9406, _Texture));
                float3 diffuseColor = _Texture_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,_Opacity),1);
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
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform sampler2D _RefractionNoise; uniform float4 _RefractionNoise_ST;
            uniform float _Refraction;
            uniform float _Opacity;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _AlbedoTextureNoise; uniform float4 _AlbedoTextureNoise_ST;
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
                float4 projPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float4 node_7186 = _Time;
                float2 node_9255 = (i.uv0+node_7186.g*float2(-0.005,-0.005));
                float4 _RefractionNoise_var = tex2D(_RefractionNoise,TRANSFORM_TEX(node_9255, _RefractionNoise));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (_RefractionNoise_var.rgb.rg*_Refraction);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _AlbedoTextureNoise_var = tex2D(_AlbedoTextureNoise,TRANSFORM_TEX(i.uv0, _AlbedoTextureNoise));
                float2 node_9406 = ((i.uv0+node_7186.g*float2(-0.005,-0.005))*_AlbedoTextureNoise_var.rgb.rg);
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(node_9406, _Texture));
                float3 diffuseColor = _Texture_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * _Opacity,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
