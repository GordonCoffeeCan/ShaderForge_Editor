// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CVR_VFX_Shaders/CVR_VFX_Rotating"
{
	Properties
	{
		_Color1("Color 1", Color) = (1,1,1,0)
		_Color2("Color 2", Color) = (1,1,1,0)
		_Color3("Color 3", Color) = (1,1,1,0)
		_Alpha_1("Alpha_1", 2D) = "white" {}
		_Alpha_2("Alpha_2", 2D) = "white" {}
		_Alpha_3("Alpha_3", 2D) = "white" {}
		_Speed("Speed", Float) = 2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting alpha:fade keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform sampler2D _Alpha_1;
		uniform float _Speed;
		uniform sampler2D _Alpha_2;
		uniform sampler2D _Alpha_3;
		uniform float4 _Alpha_3_ST;
		uniform float4 _Color3;
		uniform float4 _Color2;
		uniform float4 _Color1;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float cos34 = cos( 1.0 * _Time.y );
			float sin34 = sin( 1.0 * _Time.y );
			float2 rotator34 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos34 , -sin34 , sin34 , cos34 )) + float2( 0.5,0.5 );
			float4 tex2DNode47 = tex2D( _Alpha_1, rotator34 );
			float temp_output_39_0 = sin( ( _Speed * _Time.y ) );
			float4 temp_cast_0 = (temp_output_39_0).xxxx;
			float4 blendOpSrc56 = tex2DNode47;
			float4 blendOpDest56 = temp_cast_0;
			float4 temp_cast_1 = (temp_output_39_0).xxxx;
			float cos35 = cos( -1.0 * _Time.y );
			float sin35 = sin( -1.0 * _Time.y );
			float2 rotator35 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos35 , -sin35 , sin35 , cos35 )) + float2( 0.5,0.5 );
			float4 tex2DNode42 = tex2D( _Alpha_2, rotator35 );
			float4 blendOpSrc57 = temp_cast_1;
			float4 blendOpDest57 = tex2DNode42;
			float4 temp_cast_2 = (temp_output_39_0).xxxx;
			float2 uv_Alpha_3 = i.uv_texcoord * _Alpha_3_ST.xy + _Alpha_3_ST.zw;
			float4 tex2DNode60 = tex2D( _Alpha_3, uv_Alpha_3 );
			float4 blendOpSrc64 = temp_cast_2;
			float4 blendOpDest64 = tex2DNode60;
			float4 blendOpSrc65 = ( ( saturate( (( blendOpDest56 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest56 ) * ( 1.0 - blendOpSrc56 ) ) : ( 2.0 * blendOpDest56 * blendOpSrc56 ) ) )) + ( saturate( (( blendOpDest57 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest57 ) * ( 1.0 - blendOpSrc57 ) ) : ( 2.0 * blendOpDest57 * blendOpSrc57 ) ) )) );
			float4 blendOpDest65 = ( saturate( (( blendOpDest64 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest64 ) * ( 1.0 - blendOpSrc64 ) ) : ( 2.0 * blendOpDest64 * blendOpSrc64 ) ) ));
			float4 break72 = ( saturate( (( blendOpDest65 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest65 ) * ( 1.0 - blendOpSrc65 ) ) : ( 2.0 * blendOpDest65 * blendOpSrc65 ) ) ));
			float4 blendOpSrc67 = _Color3;
			float4 blendOpDest67 = tex2DNode42;
			float4 blendOpSrc69 = tex2DNode47;
			float4 blendOpDest69 = _Color2;
			float4 blendOpSrc70 = ( saturate( (( blendOpDest67 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest67 ) * ( 1.0 - blendOpSrc67 ) ) : ( 2.0 * blendOpDest67 * blendOpSrc67 ) ) ));
			float4 blendOpDest70 = ( saturate( (( blendOpDest69 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest69 ) * ( 1.0 - blendOpSrc69 ) ) : ( 2.0 * blendOpDest69 * blendOpSrc69 ) ) ));
			float4 blendOpSrc61 = tex2DNode60;
			float4 blendOpDest61 = _Color1;
			float4 blendOpSrc71 = ( saturate( (( blendOpDest70 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest70 ) * ( 1.0 - blendOpSrc70 ) ) : ( 2.0 * blendOpDest70 * blendOpSrc70 ) ) ));
			float4 blendOpDest71 = ( saturate( (( blendOpDest61 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest61 ) * ( 1.0 - blendOpSrc61 ) ) : ( 2.0 * blendOpDest61 * blendOpSrc61 ) ) ));
			float4 appendResult73 = (float4(break72.r , break72.g , break72.b , 0.0));
			c.rgb = ( ( saturate( ( blendOpSrc71 + blendOpDest71 ) )) * appendResult73 ).rgb;
			c.a = break72;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
7;1087;1906;1014;2666.648;770.4416;1.747649;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;33;-3007.54,-406.4805;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;36;-2915.601,209.2325;Float;True;Property;_Speed;Speed;6;0;Create;True;0;0;False;0;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;38;-2872.112,511.344;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;35;-2600.688,-169.1503;Inherit;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;34;-2589.324,-557.4547;Inherit;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-2582.253,317.8329;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;47;-2168.425,-690.3228;Inherit;True;Property;_Alpha_1;Alpha_1;3;0;Create;True;0;0;False;0;-1;431b832724ed9a1449068b573036b180;431b832724ed9a1449068b573036b180;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;42;-2152.974,-135.4713;Inherit;True;Property;_Alpha_2;Alpha_2;4;0;Create;True;0;0;False;0;-1;7292eef4cf7686443822412034c6aca0;7292eef4cf7686443822412034c6aca0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;39;-2349.956,318.4403;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;60;-1508.748,668.6646;Inherit;True;Property;_Alpha_3;Alpha_3;5;0;Create;True;0;0;False;0;-1;dc5e9806e6db95443b4d4f1780ee5a6b;dc5e9806e6db95443b4d4f1780ee5a6b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;57;-1441.425,-45.64845;Inherit;True;Overlay;True;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;56;-1395.018,-246.7728;Inherit;False;Overlay;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;64;-1090.164,452.3339;Inherit;True;Overlay;True;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;58;-1062.58,-108.5833;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;68;-1524.011,-517.4119;Inherit;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;66;-1747.549,-1105.17;Inherit;False;Property;_Color3;Color 3;2;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;67;-1309.54,-1025.807;Inherit;True;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;65;-763.7799,169.0138;Inherit;True;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;69;-1223.904,-662.2064;Inherit;True;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;63;-1392.006,954.5693;Inherit;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;72;-351.8826,-29.08253;Inherit;True;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BlendOpsNode;70;-829.3257,-890.396;Inherit;True;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;61;-993.2665,794.1453;Inherit;True;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;73;-117.9176,-235.7903;Inherit;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BlendOpsNode;71;-355.5479,-628.5644;Inherit;True;LinearDodge;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;42.09265,-519.2867;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;364.8396,-360.1541;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;CVR_VFX_Shaders/CVR_VFX_Rotating;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;2;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;35;0;33;0
WireConnection;34;0;33;0
WireConnection;37;0;36;0
WireConnection;37;1;38;0
WireConnection;47;1;34;0
WireConnection;42;1;35;0
WireConnection;39;0;37;0
WireConnection;57;0;39;0
WireConnection;57;1;42;0
WireConnection;56;0;47;0
WireConnection;56;1;39;0
WireConnection;64;0;39;0
WireConnection;64;1;60;0
WireConnection;58;0;56;0
WireConnection;58;1;57;0
WireConnection;67;0;66;0
WireConnection;67;1;42;0
WireConnection;65;0;58;0
WireConnection;65;1;64;0
WireConnection;69;0;47;0
WireConnection;69;1;68;0
WireConnection;72;0;65;0
WireConnection;70;0;67;0
WireConnection;70;1;69;0
WireConnection;61;0;60;0
WireConnection;61;1;63;0
WireConnection;73;0;72;0
WireConnection;73;1;72;1
WireConnection;73;2;72;2
WireConnection;71;0;70;0
WireConnection;71;1;61;0
WireConnection;74;0;71;0
WireConnection;74;1;73;0
WireConnection;2;9;72;0
WireConnection;2;13;74;0
ASEEND*/
//CHKSM=2961C0D08712D67B657D58E87032BF0C6133147D