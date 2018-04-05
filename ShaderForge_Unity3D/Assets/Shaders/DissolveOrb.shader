// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:2,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32646,y:32803,varname:node_4013,prsc:2|diff-9091-RGB,emission-9405-RGB,clip-8419-OUT;n:type:ShaderForge.SFN_Tex2d,id:6916,x:32503,y:33322,ptovrint:False,ptlb:Dissolve Noise,ptin:_DissolveNoise,varname:node_6916,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-7339-UVOUT;n:type:ShaderForge.SFN_Slider,id:1311,x:31656,y:33150,ptovrint:False,ptlb:Dissolve Amount,ptin:_DissolveAmount,varname:node_1311,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_OneMinus,id:8547,x:32023,y:33146,varname:node_8547,prsc:2|IN-1311-OUT;n:type:ShaderForge.SFN_RemapRange,id:818,x:32191,y:33146,varname:node_818,prsc:2,frmn:0,frmx:1,tomn:-0.65,tomx:0.65|IN-8547-OUT;n:type:ShaderForge.SFN_Add,id:8419,x:32410,y:33146,varname:node_8419,prsc:2|A-818-OUT,B-6916-R;n:type:ShaderForge.SFN_RemapRange,id:4212,x:31750,y:32940,varname:node_4212,prsc:2,frmn:0,frmx:1,tomn:-4,tomx:4|IN-8419-OUT;n:type:ShaderForge.SFN_Clamp01,id:2918,x:31714,y:32640,varname:node_2918,prsc:2|IN-4212-OUT;n:type:ShaderForge.SFN_Tex2d,id:9405,x:32422,y:32863,varname:node_9405,prsc:2,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False|UVIN-9038-OUT,TEX-6352-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6352,x:32191,y:32940,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_6352,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Append,id:9038,x:32164,y:32706,varname:node_9038,prsc:2|A-2265-OUT,B-2415-OUT;n:type:ShaderForge.SFN_Vector1,id:2415,x:31988,y:32803,varname:node_2415,prsc:2,v1:0;n:type:ShaderForge.SFN_OneMinus,id:2265,x:31895,y:32640,varname:node_2265,prsc:2|IN-2918-OUT;n:type:ShaderForge.SFN_Tex2d,id:9091,x:32380,y:32617,ptovrint:False,ptlb:Diffuse Texture,ptin:_DiffuseTexture,varname:node_9091,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False|UVIN-4210-OUT;n:type:ShaderForge.SFN_TexCoord,id:1568,x:31918,y:33340,varname:node_1568,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7339,x:32119,y:33340,varname:node_7339,prsc:2,spu:0,spv:0.1|UVIN-1568-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4210,x:32134,y:32424,varname:node_4210,prsc:2|A-7894-UVOUT,B-3052-OUT;n:type:ShaderForge.SFN_Panner,id:7894,x:31928,y:32241,varname:node_7894,prsc:2,spu:-0.01,spv:-0.01|UVIN-4758-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4758,x:31726,y:32241,varname:node_4758,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:3052,x:31928,y:32424,varname:node_3052,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6946-RGB;n:type:ShaderForge.SFN_Tex2d,id:6946,x:31726,y:32424,ptovrint:False,ptlb:Diffuse Noise,ptin:_DiffuseNoise,varname:_TextureNoise_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;proporder:9091-6946-6916-1311-6352;pass:END;sub:END;*/

Shader "DissolveOrb" {
    Properties {
        _DiffuseTexture ("Diffuse Texture", 2D) = "white" {}
        _DiffuseNoise ("Diffuse Noise", 2D) = "white" {}
        _DissolveNoise ("Dissolve Noise", 2D) = "white" {}
        _DissolveAmount ("Dissolve Amount", Range(0, 1)) = 0.5
        _Ramp ("Ramp", 2D) = "black" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _DissolveNoise; uniform float4 _DissolveNoise_ST;
            uniform float _DissolveAmount;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
            uniform sampler2D _DiffuseTexture; uniform float4 _DiffuseTexture_ST;
            uniform sampler2D _DiffuseNoise; uniform float4 _DiffuseNoise_ST;
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
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 node_3832 = _Time;
                float2 node_7339 = (i.uv0+node_3832.g*float2(0,0.1));
                float4 _DissolveNoise_var = tex2D(_DissolveNoise,TRANSFORM_TEX(node_7339, _DissolveNoise));
                float node_8419 = (((1.0 - _DissolveAmount)*1.3+-0.65)+_DissolveNoise_var.r);
                clip(node_8419 - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _DiffuseNoise_var = tex2D(_DiffuseNoise,TRANSFORM_TEX(i.uv0, _DiffuseNoise));
                float2 node_4210 = ((i.uv0+node_3832.g*float2(-0.01,-0.01))*_DiffuseNoise_var.rgb.rg);
                float4 _DiffuseTexture_var = tex2D(_DiffuseTexture,TRANSFORM_TEX(node_4210, _DiffuseTexture));
                float3 diffuseColor = _DiffuseTexture_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float2 node_9038 = float2((1.0 - saturate((node_8419*8.0+-4.0))),0.0);
                float4 node_9405 = tex2D(_Ramp,TRANSFORM_TEX(node_9038, _Ramp));
                float3 emissive = node_9405.rgb;
/// Final Color:
                float3 finalColor = diffuse + emissive;
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _DissolveNoise; uniform float4 _DissolveNoise_ST;
            uniform float _DissolveAmount;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
            uniform sampler2D _DiffuseTexture; uniform float4 _DiffuseTexture_ST;
            uniform sampler2D _DiffuseNoise; uniform float4 _DiffuseNoise_ST;
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
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 node_5991 = _Time;
                float2 node_7339 = (i.uv0+node_5991.g*float2(0,0.1));
                float4 _DissolveNoise_var = tex2D(_DissolveNoise,TRANSFORM_TEX(node_7339, _DissolveNoise));
                float node_8419 = (((1.0 - _DissolveAmount)*1.3+-0.65)+_DissolveNoise_var.r);
                clip(node_8419 - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _DiffuseNoise_var = tex2D(_DiffuseNoise,TRANSFORM_TEX(i.uv0, _DiffuseNoise));
                float2 node_4210 = ((i.uv0+node_5991.g*float2(-0.01,-0.01))*_DiffuseNoise_var.rgb.rg);
                float4 _DiffuseTexture_var = tex2D(_DiffuseTexture,TRANSFORM_TEX(node_4210, _DiffuseTexture));
                float3 diffuseColor = _DiffuseTexture_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            uniform sampler2D _DissolveNoise; uniform float4 _DissolveNoise_ST;
            uniform float _DissolveAmount;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_4672 = _Time;
                float2 node_7339 = (i.uv0+node_4672.g*float2(0,0.1));
                float4 _DissolveNoise_var = tex2D(_DissolveNoise,TRANSFORM_TEX(node_7339, _DissolveNoise));
                float node_8419 = (((1.0 - _DissolveAmount)*1.3+-0.65)+_DissolveNoise_var.r);
                clip(node_8419 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
