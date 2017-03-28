// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|normal-1688-RGB,custl-7428-OUT,olwid-1361-OUT,olcol-6019-RGB;n:type:ShaderForge.SFN_Color,id:6019,x:32926,y:33119,ptovrint:False,ptlb:Outline Color,ptin:_OutlineColor,varname:node_6019,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_LightVector,id:2298,x:32158,y:32804,varname:node_2298,prsc:2;n:type:ShaderForge.SFN_Dot,id:2676,x:32337,y:32853,varname:node_2676,prsc:2,dt:0|A-2298-OUT,B-8985-OUT;n:type:ShaderForge.SFN_NormalVector,id:8985,x:32158,y:32927,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:1361,x:32848,y:33012,ptovrint:False,ptlb:Outline Width,ptin:_OutlineWidth,varname:node_1361,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.05,max:0.1;n:type:ShaderForge.SFN_Append,id:288,x:32521,y:32841,varname:node_288,prsc:2|A-2676-OUT,B-2676-OUT;n:type:ShaderForge.SFN_Tex2d,id:2482,x:32722,y:32875,ptovrint:False,ptlb:Clamp,ptin:_Clamp,varname:node_2482,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:abbafe24419a0b0498da6a154be75481,ntxv:0,isnm:False|UVIN-288-OUT;n:type:ShaderForge.SFN_Tex2d,id:6028,x:32731,y:32666,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_6028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c593e3a4f64c1ba46b47f535a9bd2204,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7428,x:32940,y:32763,varname:node_7428,prsc:2|A-6028-RGB,B-2482-RGB;n:type:ShaderForge.SFN_Tex2d,id:1688,x:32924,y:32486,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:node_1688,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3460a82732949ef46853fd1c8ccac4fc,ntxv:3,isnm:True;proporder:6019-1361-2482-6028-1688;pass:END;sub:END;*/

Shader "Shader Forge/CartoonEffect" {
    Properties {
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _OutlineWidth ("Outline Width", Range(0, 0.1)) = 0.05
        _Clamp ("Clamp", 2D) = "white" {}
        _Texture ("Texture", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
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
            uniform float4 _OutlineColor;
            uniform float _OutlineWidth;
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
                o.pos = mul(UNITY_MATRIX_MVP, float4(v.vertex.xyz + v.normal*_OutlineWidth,1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(_OutlineColor.rgb,0);
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Clamp; uniform float4 _Clamp_ST;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
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
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float node_2676 = dot(lightDirection,i.normalDir);
                float2 node_288 = float2(node_2676,node_2676);
                float4 _Clamp_var = tex2D(_Clamp,TRANSFORM_TEX(node_288, _Clamp));
                float3 finalColor = (_Texture_var.rgb*_Clamp_var.rgb);
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Clamp; uniform float4 _Clamp_ST;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
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
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float node_2676 = dot(lightDirection,i.normalDir);
                float2 node_288 = float2(node_2676,node_2676);
                float4 _Clamp_var = tex2D(_Clamp,TRANSFORM_TEX(node_288, _Clamp));
                float3 finalColor = (_Texture_var.rgb*_Clamp_var.rgb);
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
