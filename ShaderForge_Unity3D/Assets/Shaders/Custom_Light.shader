// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33380,y:32743,varname:node_9361,prsc:2|normal-9780-RGB,custl-4291-OUT;n:type:ShaderForge.SFN_Dot,id:1330,x:32811,y:32698,varname:node_1330,prsc:2,dt:1|A-6733-OUT,B-127-OUT;n:type:ShaderForge.SFN_NormalVector,id:6733,x:32611,y:32829,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:127,x:32618,y:32451,varname:node_127,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1598,x:32987,y:32866,varname:node_1598,prsc:2|A-1330-OUT,B-209-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:209,x:32811,y:32946,varname:node_209,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4291,x:33231,y:32907,varname:node_4291,prsc:2|A-7484-OUT,B-883-RGB;n:type:ShaderForge.SFN_LightColor,id:883,x:32987,y:33086,varname:node_883,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:531,x:32630,y:32618,varname:node_531,prsc:2;n:type:ShaderForge.SFN_Dot,id:7728,x:32859,y:32535,varname:node_7728,prsc:2,dt:1|A-127-OUT,B-531-OUT;n:type:ShaderForge.SFN_Add,id:7629,x:33072,y:32681,varname:node_7629,prsc:2|A-6205-OUT,B-1598-OUT;n:type:ShaderForge.SFN_Tex2d,id:9780,x:33472,y:32426,ptovrint:False,ptlb:node_9780,ptin:_node_9780,varname:node_9780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Power,id:9282,x:33012,y:32423,varname:node_9282,prsc:2|VAL-7728-OUT,EXP-9082-OUT;n:type:ShaderForge.SFN_Exp,id:9082,x:32775,y:32346,varname:node_9082,prsc:2,et:0|IN-5365-OUT;n:type:ShaderForge.SFN_Slider,id:5365,x:32415,y:32327,ptovrint:False,ptlb:Specular,ptin:_Specular,varname:node_5365,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1543,x:32736,y:32201,ptovrint:False,ptlb:node_1543,ptin:_node_1543,varname:node_1543,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6068376,max:1;n:type:ShaderForge.SFN_Multiply,id:6205,x:33134,y:32268,varname:node_6205,prsc:2|A-1543-OUT,B-9282-OUT;n:type:ShaderForge.SFN_Fresnel,id:3175,x:33253,y:32624,varname:node_3175,prsc:2|NRM-6733-OUT,EXP-3778-OUT;n:type:ShaderForge.SFN_Add,id:7484,x:33490,y:32588,varname:node_7484,prsc:2|A-8086-RGB,B-3175-OUT;n:type:ShaderForge.SFN_Slider,id:3778,x:32915,y:32572,ptovrint:False,ptlb:node_3778,ptin:_node_3778,varname:node_3778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:8086,x:33414,y:32194,ptovrint:False,ptlb:node_8086,ptin:_node_8086,varname:node_8086,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;proporder:9780-5365-1543-3778-8086;pass:END;sub:END;*/

Shader "Shader Forge/Custom_Light" {
    Properties {
        _node_9780 ("node_9780", 2D) = "bump" {}
        _Specular ("Specular", Range(0, 1)) = 0
        _node_1543 ("node_1543", Range(0, 1)) = 0.6068376
        _node_3778 ("node_3778", Range(0, 1)) = 0
        _node_8086 ("node_8086", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _node_9780; uniform float4 _node_9780_ST;
            uniform float _node_3778;
            uniform sampler2D _node_8086; uniform float4 _node_8086_ST;
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
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_9780_var = UnpackNormal(tex2D(_node_9780,TRANSFORM_TEX(i.uv0, _node_9780)));
                float3 normalLocal = _node_9780_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float4 _node_8086_var = tex2D(_node_8086,TRANSFORM_TEX(i.uv0, _node_8086));
                float3 finalColor = ((_node_8086_var.rgb+pow(1.0-max(0,dot(i.normalDir, viewDirection)),_node_3778))*_LightColor0.rgb);
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
            uniform float4 _LightColor0;
            uniform sampler2D _node_9780; uniform float4 _node_9780_ST;
            uniform float _node_3778;
            uniform sampler2D _node_8086; uniform float4 _node_8086_ST;
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
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_9780_var = UnpackNormal(tex2D(_node_9780,TRANSFORM_TEX(i.uv0, _node_9780)));
                float3 normalLocal = _node_9780_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float4 _node_8086_var = tex2D(_node_8086,TRANSFORM_TEX(i.uv0, _node_8086));
                float3 finalColor = ((_node_8086_var.rgb+pow(1.0-max(0,dot(i.normalDir, viewDirection)),_node_3778))*_LightColor0.rgb);
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
