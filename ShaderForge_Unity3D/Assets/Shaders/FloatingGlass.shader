// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.05,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33207,y:32501,varname:node_9361,prsc:2|normal-8562-RGB,emission-336-OUT,custl-6744-OUT,alpha-497-OUT,refract-6231-OUT;n:type:ShaderForge.SFN_Color,id:3211,x:32096,y:32316,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_3211,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:9236,x:32640,y:32676,ptovrint:False,ptlb:Transparency,ptin:_Transparency,varname:node_9236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_NormalVector,id:3994,x:31330,y:32628,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:5482,x:31024,y:32329,varname:node_5482,prsc:2;n:type:ShaderForge.SFN_Dot,id:164,x:31510,y:32548,varname:node_164,prsc:2,dt:1|A-5482-OUT,B-3994-OUT;n:type:ShaderForge.SFN_Vector1,id:8791,x:31671,y:32781,varname:node_8791,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:1026,x:31707,y:32625,varname:node_1026,prsc:2|A-164-OUT,B-8791-OUT;n:type:ShaderForge.SFN_Multiply,id:8240,x:31903,y:32641,varname:node_8240,prsc:2|A-1026-OUT,B-8791-OUT;n:type:ShaderForge.SFN_Multiply,id:2996,x:32078,y:32513,varname:node_2996,prsc:2|A-8240-OUT,B-8240-OUT;n:type:ShaderForge.SFN_Multiply,id:556,x:32362,y:32348,varname:node_556,prsc:2|A-3211-RGB,B-2996-OUT,C-7556-RGB;n:type:ShaderForge.SFN_LightColor,id:197,x:32860,y:32518,varname:node_197,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6744,x:32871,y:32300,varname:node_6744,prsc:2|A-5694-OUT,B-197-RGB;n:type:ShaderForge.SFN_ViewReflectionVector,id:3536,x:31181,y:31977,varname:node_3536,prsc:2;n:type:ShaderForge.SFN_Dot,id:3794,x:31467,y:32005,varname:node_3794,prsc:2,dt:1|A-3536-OUT,B-5482-OUT;n:type:ShaderForge.SFN_Power,id:2668,x:32082,y:32022,varname:node_2668,prsc:2|VAL-3794-OUT,EXP-2300-OUT;n:type:ShaderForge.SFN_Exp,id:2300,x:31880,y:32083,varname:node_2300,prsc:2,et:1|IN-436-OUT;n:type:ShaderForge.SFN_Slider,id:9168,x:31297,y:32237,ptovrint:False,ptlb:SpecPower,ptin:_SpecPower,varname:node_9168,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Slider,id:7420,x:31624,y:31776,ptovrint:False,ptlb:SpecIntensity,ptin:_SpecIntensity,varname:node_7420,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:6981,x:32101,y:31849,varname:node_6981,prsc:2|A-7420-OUT,B-2668-OUT;n:type:ShaderForge.SFN_Add,id:5694,x:32634,y:32288,varname:node_5694,prsc:2|A-6981-OUT,B-556-OUT,C-9414-OUT;n:type:ShaderForge.SFN_Tex2d,id:8562,x:33295,y:32285,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_8562,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-8083-UVOUT;n:type:ShaderForge.SFN_NormalVector,id:5627,x:32481,y:33013,prsc:2,pt:True;n:type:ShaderForge.SFN_Transform,id:694,x:32748,y:33026,varname:node_694,prsc:2,tffrom:0,tfto:3|IN-6468-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6511,x:32950,y:33026,varname:node_6511,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-694-XYZ;n:type:ShaderForge.SFN_Multiply,id:6231,x:33155,y:33069,varname:node_6231,prsc:2|A-6511-OUT,B-3767-OUT;n:type:ShaderForge.SFN_Slider,id:810,x:32697,y:33307,ptovrint:False,ptlb:RefectionScale,ptin:_RefectionScale,varname:node_810,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Vector1,id:9696,x:32854,y:33205,varname:node_9696,prsc:2,v1:-0.1;n:type:ShaderForge.SFN_Multiply,id:3767,x:33127,y:33222,varname:node_3767,prsc:2|A-9696-OUT,B-810-OUT;n:type:ShaderForge.SFN_Fresnel,id:8999,x:31754,y:32915,varname:node_8999,prsc:2|NRM-3994-OUT,EXP-3223-OUT;n:type:ShaderForge.SFN_Slider,id:1335,x:30997,y:32933,ptovrint:False,ptlb:FallOffAmount,ptin:_FallOffAmount,varname:node_1335,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:9414,x:32568,y:32460,varname:node_9414,prsc:2|A-556-OUT,B-88-OUT,C-6238-RGB;n:type:ShaderForge.SFN_Multiply,id:88,x:32205,y:32855,varname:node_88,prsc:2|A-8999-OUT,B-778-OUT;n:type:ShaderForge.SFN_Slider,id:3992,x:31676,y:33136,ptovrint:False,ptlb:FallOffIntensity,ptin:_FallOffIntensity,varname:node_3992,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Color,id:6238,x:32480,y:32637,ptovrint:False,ptlb:FallOffColor,ptin:_FallOffColor,varname:node_6238,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_RemapRange,id:497,x:32964,y:32676,varname:node_497,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-9236-OUT;n:type:ShaderForge.SFN_RemapRange,id:8330,x:31627,y:32237,varname:node_8330,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-9168-OUT;n:type:ShaderForge.SFN_Multiply,id:436,x:31854,y:32244,varname:node_436,prsc:2|A-8330-OUT,B-1130-OUT;n:type:ShaderForge.SFN_Vector1,id:1130,x:31827,y:32455,varname:node_1130,prsc:2,v1:8;n:type:ShaderForge.SFN_Vector1,id:203,x:31154,y:33067,varname:node_203,prsc:2,v1:5;n:type:ShaderForge.SFN_Vector1,id:6650,x:31833,y:33272,varname:node_6650,prsc:2,v1:20;n:type:ShaderForge.SFN_Multiply,id:3223,x:31393,y:32972,varname:node_3223,prsc:2|A-1335-OUT,B-203-OUT;n:type:ShaderForge.SFN_Multiply,id:778,x:32038,y:33046,varname:node_778,prsc:2|A-3992-OUT,B-6650-OUT;n:type:ShaderForge.SFN_Tex2d,id:6252,x:33354,y:31506,ptovrint:False,ptlb:EmissionTexture,ptin:_EmissionTexture,varname:node_6252,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8083-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5600,x:32398,y:31645,varname:node_5600,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:9388,x:32665,y:31842,ptovrint:False,ptlb:Nosie,ptin:_Nosie,varname:node_9388,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6747-UVOUT;n:type:ShaderForge.SFN_Panner,id:6747,x:32679,y:31636,varname:node_6747,prsc:2,spu:0,spv:0.2|UVIN-5600-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:6644,x:32892,y:31842,varname:node_6644,prsc:2,cc1:0,cc2:0,cc3:-1,cc4:-1|IN-9388-RGB;n:type:ShaderForge.SFN_Slider,id:5088,x:33027,y:32136,ptovrint:False,ptlb:NoiseIntensity,ptin:_NoiseIntensity,varname:node_5088,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:10;n:type:ShaderForge.SFN_Multiply,id:7644,x:33138,y:31842,varname:node_7644,prsc:2|A-6644-OUT,B-5088-OUT;n:type:ShaderForge.SFN_Tex2d,id:7556,x:32279,y:32572,ptovrint:False,ptlb:AlbedoTexture,ptin:_AlbedoTexture,varname:node_7556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8083-UVOUT;n:type:ShaderForge.SFN_Multiply,id:336,x:33678,y:31876,varname:node_336,prsc:2|A-6252-RGB,B-3211-RGB;n:type:ShaderForge.SFN_Multiply,id:6468,x:32546,y:33206,varname:node_6468,prsc:2|A-5627-OUT,B-7644-OUT;n:type:ShaderForge.SFN_Panner,id:8083,x:32679,y:31455,varname:node_8083,prsc:2,spu:0,spv:0.1|UVIN-5600-UVOUT;proporder:3211-7556-8562-6252-9388-9236-9168-7420-810-6238-1335-3992-5088;pass:END;sub:END;*/

Shader "CVR_VFX_Shaders/FloatingGlassShader" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _AlbedoTexture ("AlbedoTexture", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "black" {}
        _EmissionTexture ("EmissionTexture", 2D) = "white" {}
        _Nosie ("Nosie", 2D) = "white" {}
        _Transparency ("Transparency", Range(0, 1)) = 0.5
        _SpecPower ("SpecPower", Range(0, 1)) = 0.5
        _SpecIntensity ("SpecIntensity", Range(0, 1)) = 0.5
        _RefectionScale ("RefectionScale", Range(0, 1)) = 0.5
        _FallOffColor ("FallOffColor", Color) = (0.5,0.5,0.5,1)
        _FallOffAmount ("FallOffAmount", Range(0, 1)) = 0.5
        _FallOffIntensity ("FallOffIntensity", Range(0, 1)) = 0.5
        _NoiseIntensity ("NoiseIntensity", Range(0, 10)) = 0.5
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
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _Color;
            uniform float _Transparency;
            uniform float _SpecPower;
            uniform float _SpecIntensity;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _RefectionScale;
            uniform float _FallOffAmount;
            uniform float _FallOffIntensity;
            uniform float4 _FallOffColor;
            uniform sampler2D _EmissionTexture; uniform float4 _EmissionTexture_ST;
            uniform sampler2D _Nosie; uniform float4 _Nosie_ST;
            uniform float _NoiseIntensity;
            uniform sampler2D _AlbedoTexture; uniform float4 _AlbedoTexture_ST;
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
                float4 projPos : TEXCOORD5;
                UNITY_FOG_COORDS(6)
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
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_2934 = _Time;
                float2 node_8083 = (i.uv0+node_2934.g*float2(0,0.1));
                float4 _NormalMap_var = tex2D(_NormalMap,TRANSFORM_TEX(node_8083, _NormalMap));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 node_6747 = (i.uv0+node_2934.g*float2(0,0.2));
                float4 _Nosie_var = tex2D(_Nosie,TRANSFORM_TEX(node_6747, _Nosie));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (mul( UNITY_MATRIX_V, float4((normalDirection*float3((_Nosie_var.rgb.rr*_NoiseIntensity),0.0)),0) ).xyz.rgb.rg*((-0.1)*_RefectionScale));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 _EmissionTexture_var = tex2D(_EmissionTexture,TRANSFORM_TEX(node_8083, _EmissionTexture));
                float3 emissive = (_EmissionTexture_var.rgb*_Color.rgb);
                float node_8791 = 0.5;
                float node_8240 = ((max(0,dot(lightDirection,normalDirection))+node_8791)*node_8791);
                float4 _AlbedoTexture_var = tex2D(_AlbedoTexture,TRANSFORM_TEX(node_8083, _AlbedoTexture));
                float3 node_556 = (_Color.rgb*(node_8240*node_8240)*_AlbedoTexture_var.rgb);
                float3 finalColor = emissive + (((_SpecIntensity*pow(max(0,dot(viewReflectDirection,lightDirection)),exp2(((_SpecPower*-1.0+1.0)*8.0))))+node_556+(node_556*(pow(1.0-max(0,dot(normalDirection, viewDirection)),(_FallOffAmount*5.0))*(_FallOffIntensity*20.0))*_FallOffColor.rgb))*_LightColor0.rgb);
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(_Transparency*-1.0+1.0)),1);
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
            uniform float4 _Color;
            uniform float _Transparency;
            uniform float _SpecPower;
            uniform float _SpecIntensity;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _RefectionScale;
            uniform float _FallOffAmount;
            uniform float _FallOffIntensity;
            uniform float4 _FallOffColor;
            uniform sampler2D _EmissionTexture; uniform float4 _EmissionTexture_ST;
            uniform sampler2D _Nosie; uniform float4 _Nosie_ST;
            uniform float _NoiseIntensity;
            uniform sampler2D _AlbedoTexture; uniform float4 _AlbedoTexture_ST;
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
                float4 projPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
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
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1044 = _Time;
                float2 node_8083 = (i.uv0+node_1044.g*float2(0,0.1));
                float4 _NormalMap_var = tex2D(_NormalMap,TRANSFORM_TEX(node_8083, _NormalMap));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 node_6747 = (i.uv0+node_1044.g*float2(0,0.2));
                float4 _Nosie_var = tex2D(_Nosie,TRANSFORM_TEX(node_6747, _Nosie));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (mul( UNITY_MATRIX_V, float4((normalDirection*float3((_Nosie_var.rgb.rr*_NoiseIntensity),0.0)),0) ).xyz.rgb.rg*((-0.1)*_RefectionScale));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float node_8791 = 0.5;
                float node_8240 = ((max(0,dot(lightDirection,normalDirection))+node_8791)*node_8791);
                float4 _AlbedoTexture_var = tex2D(_AlbedoTexture,TRANSFORM_TEX(node_8083, _AlbedoTexture));
                float3 node_556 = (_Color.rgb*(node_8240*node_8240)*_AlbedoTexture_var.rgb);
                float3 finalColor = (((_SpecIntensity*pow(max(0,dot(viewReflectDirection,lightDirection)),exp2(((_SpecPower*-1.0+1.0)*8.0))))+node_556+(node_556*(pow(1.0-max(0,dot(normalDirection, viewDirection)),(_FallOffAmount*5.0))*(_FallOffIntensity*20.0))*_FallOffColor.rgb))*_LightColor0.rgb);
                fixed4 finalRGBA = fixed4(finalColor * (_Transparency*-1.0+1.0),0);
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
