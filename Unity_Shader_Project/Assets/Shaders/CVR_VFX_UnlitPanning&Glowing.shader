// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CVR_VFX_Shaders/UnlitPanning&Glowing"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,0)
		_Albedo("Albedo", 2D) = "white" {}
		_Emission("Emission", 2D) = "white" {}
		_Alpha("Alpha", 2D) = "white" {}
		_Noise("Noise", 2D) = "white" {}
		_NoiseIntensity("NoiseIntensity", Range( -1 , 1)) = 0.5
		_ScrollSpeed("ScrollSpeed", Range( -1 , 1)) = 0.2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
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

		uniform sampler2D _Emission;
		uniform float _ScrollSpeed;
		uniform float4 _Color;
		uniform sampler2D _Albedo;
		uniform sampler2D _Noise;
		uniform float _NoiseIntensity;
		uniform sampler2D _Alpha;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 appendResult10 = (float2(0.0 , ( _ScrollSpeed * 1.5 )));
			float2 temp_output_8_0 = ( i.uv_texcoord + ( appendResult10 * _Time.y ) );
			float4 tex2DNode6 = tex2D( _Noise, temp_output_8_0 );
			float2 appendResult21 = (float2(tex2DNode6.r , tex2DNode6.r));
			float temp_output_18_0 = ( _NoiseIntensity * 0.1 );
			float2 break28 = ( i.uv_texcoord + ( appendResult21 * temp_output_18_0 ) );
			float temp_output_23_0 = ( temp_output_18_0 * -0.5 );
			float2 appendResult29 = (float2(( break28.x + temp_output_23_0 ) , ( break28.y + temp_output_23_0 )));
			float4 temp_output_31_0 = ( _Color * tex2D( _Albedo, appendResult29 ) );
			c.rgb = temp_output_31_0.rgb;
			c.a = tex2D( _Alpha, appendResult29 ).a;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 appendResult10 = (float2(0.0 , ( _ScrollSpeed * 1.5 )));
			float2 temp_output_8_0 = ( i.uv_texcoord + ( appendResult10 * _Time.y ) );
			float4 tex2DNode6 = tex2D( _Noise, temp_output_8_0 );
			float2 appendResult21 = (float2(tex2DNode6.r , tex2DNode6.r));
			float temp_output_18_0 = ( _NoiseIntensity * 0.1 );
			float2 break28 = ( i.uv_texcoord + ( appendResult21 * temp_output_18_0 ) );
			float temp_output_23_0 = ( temp_output_18_0 * -0.5 );
			float2 appendResult29 = (float2(( break28.x + temp_output_23_0 ) , ( break28.y + temp_output_23_0 )));
			float4 temp_output_31_0 = ( _Color * tex2D( _Albedo, appendResult29 ) );
			o.Emission = ( tex2D( _Emission, temp_output_8_0 ) + temp_output_31_0 + temp_output_31_0 ).rgb;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
7;1081;1906;1020;3856.384;634.3848;1.3;True;False
Node;AmplifyShaderEditor.RangedFloatNode;12;-3565.364,182.2364;Inherit;False;Property;_ScrollSpeed;ScrollSpeed;6;0;Create;True;0;0;False;0;0.2;0.2;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-3458.149,384.5249;Inherit;False;Constant;_Float1;Float 1;4;0;Create;True;0;0;False;0;1.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-3236.514,204.6043;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-3256.553,0.5431933;Inherit;False;Constant;_Float0;Float 0;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;15;-3164.122,377.6064;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;10;-3077.322,62.52125;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;7;-2851.812,-289.4013;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-2870.927,133.0653;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-2628.901,-119.6702;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-2493.833,280.5237;Inherit;False;Property;_NoiseIntensity;NoiseIntensity;5;0;Create;True;0;0;False;0;0.5;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-2395.423,403.1642;Inherit;False;Constant;_Float2;Float 2;4;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;6;-2450.302,-6.658277;Inherit;True;Property;_Noise;Noise;4;0;Create;True;0;0;False;0;-1;None;8c9574dcef955724eb1a127e8895a90d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-2105.423,326.1642;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;21;-2088.423,-66.83581;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-1823.2,41.34833;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-1735.457,429.5804;Inherit;False;Constant;_Float3;Float 3;4;0;Create;True;0;0;False;0;-0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-1713.315,-250.2766;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;28;-1536.83,-33.32401;Inherit;True;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-1518.814,296.0362;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;-1203.115,-29.00399;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;26;-1170.078,170.3804;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;29;-1015.099,44.5763;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;3;-781.6595,-108.2285;Inherit;True;Property;_Albedo;Albedo;1;0;Create;True;0;0;False;0;-1;None;4ee87de8f3d9a48499d40e6308185180;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;30;-829.3104,-334.5467;Inherit;False;Property;_Color;Color;0;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-562.6749,-321.4641;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;5;-2058.73,-619.0406;Inherit;True;Property;_Emission;Emission;2;0;Create;True;0;0;False;0;-1;None;c1970fdd536af7642a62d44721e49718;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;32;-360.4109,-579.3988;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;4;-783.3683,231.8658;Inherit;True;Property;_Alpha;Alpha;3;0;Create;True;0;0;False;0;-1;None;53719699c6301af4aafeec3d80ec2b1d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;2;75,-113;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;CVR_VFX_Shaders/UnlitPanning&Glowing;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;2;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;9;0;12;0
WireConnection;9;1;13;0
WireConnection;10;0;11;0
WireConnection;10;1;9;0
WireConnection;14;0;10;0
WireConnection;14;1;15;0
WireConnection;8;0;7;0
WireConnection;8;1;14;0
WireConnection;6;1;8;0
WireConnection;18;0;16;0
WireConnection;18;1;17;0
WireConnection;21;0;6;1
WireConnection;21;1;6;1
WireConnection;20;0;21;0
WireConnection;20;1;18;0
WireConnection;22;0;7;0
WireConnection;22;1;20;0
WireConnection;28;0;22;0
WireConnection;23;0;18;0
WireConnection;23;1;24;0
WireConnection;25;0;28;0
WireConnection;25;1;23;0
WireConnection;26;0;28;1
WireConnection;26;1;23;0
WireConnection;29;0;25;0
WireConnection;29;1;26;0
WireConnection;3;1;29;0
WireConnection;31;0;30;0
WireConnection;31;1;3;0
WireConnection;5;1;8;0
WireConnection;32;0;5;0
WireConnection;32;1;31;0
WireConnection;32;2;31;0
WireConnection;4;1;29;0
WireConnection;2;2;32;0
WireConnection;2;9;4;4
WireConnection;2;13;31;0
ASEEND*/
//CHKSM=2E593EF3A5BF4F90ABAF4263FF02A95B0B28A4F0