// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CVR_VFX_Shaders/Water_Shader"
{
	Properties
	{
		_WaterColor("Water Color", Color) = (0.09803922,0.3686275,0.4352941,0)
		_TopColor("Top Color", Color) = (0.2117647,0.5176471,0.4980392,0)
		_NormalMap("Normal Map", 2D) = "white" {}
		_NormalTiles("NormalTiles", Range( 0 , 0.5)) = 0.3
		_NormalStrength("Normal Strength", Range( 0 , 1)) = 1
		_NormalSpeed("Normal Speed", Range( 0 , 0.3)) = 0.1
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.85
		_SeaFoam("Sea Foam", 2D) = "white" {}
		_SeaFoamTile("Sea Foam Tile", Range( 0 , 3)) = 1
		_EdgeFoamTile("Edge Foam Tile", Range( 0 , 5)) = 2
		_EdgePower("Edge Power", Range( 0 , 1)) = 0.5
		_EdgeDistance("Edge Distance", Range( 0 , 1)) = 0.3
		_WaveDirection("Wave Direction", Vector) = (1,0,0,0)
		_WaveStretch("Wave Stretch", Vector) = (0.5,0.1,0,0)
		_WaveSpeed("Wave Speed", Range( 0 , 1)) = 0.3
		_WaveTile("Wave Tile", Range( 0 , 1)) = 0.3
		_WaveHeight("Wave Height", Range( 0 , 1)) = 0.3
		_RefractAmount("Refract Amount", Range( 0 , 1)) = 0.3
		_WaterDepth("Water Depth", Range( 0 , 20)) = 15
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		GrabPass{ }
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#include "UnityCG.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf Standard keepalpha noshadow vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float3 worldPos;
			float4 screenPos;
		};

		uniform float _WaveHeight;
		uniform float _WaveSpeed;
		uniform float2 _WaveDirection;
		uniform float2 _WaveStretch;
		uniform float _WaveTile;
		uniform sampler2D _NormalMap;
		uniform float _NormalStrength;
		uniform float _NormalSpeed;
		uniform float _NormalTiles;
		uniform float4 _WaterColor;
		uniform float4 _TopColor;
		uniform sampler2D _SeaFoam;
		uniform float _SeaFoamTile;
		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform float _RefractAmount;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _WaterDepth;
		uniform float _EdgePower;
		uniform float _EdgeDistance;
		uniform float _EdgeFoamTile;
		uniform float _Smoothness;


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			float4 Tesselation142 = UnityDistanceBasedTess( v0.vertex, v1.vertex, v2.vertex, 0.0,80.0,( _WaveHeight * 4.0 ));
			return Tesselation142;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float temp_output_5_0 = ( _Time.y * _WaveSpeed );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float4 appendResult10 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
			float4 WorldSpaceTile11 = appendResult10;
			float4 WaveTileUV21 = ( ( WorldSpaceTile11 * float4( _WaveStretch, 0.0 , 0.0 ) ) * _WaveTile );
			float2 panner3 = ( temp_output_5_0 * _WaveDirection + WaveTileUV21.xy);
			float simplePerlin2D1 = snoise( panner3 );
			float2 panner24 = ( temp_output_5_0 * _WaveDirection + ( WaveTileUV21 * float4( 0.1,0.1,0,0 ) ).xy);
			float simplePerlin2D25 = snoise( panner24 );
			float temp_output_27_0 = ( simplePerlin2D1 + simplePerlin2D25 );
			float3 WaveHeight35 = ( ( float3(0,0.5,0) * _WaveHeight ) * temp_output_27_0 );
			v.vertex.xyz += WaveHeight35;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float4 appendResult10 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
			float4 WorldSpaceTile11 = appendResult10;
			float4 temp_output_68_0 = ( ( WorldSpaceTile11 / 10.0 ) * _NormalTiles );
			float2 panner72 = ( 1.0 * _Time.y * ( float2( 1,0 ) * _NormalSpeed ) + temp_output_68_0.xy);
			float2 panner73 = ( 1.0 * _Time.y * ( float2( -1,0 ) * ( _NormalSpeed * 1.0 ) ) + ( temp_output_68_0 * ( _NormalTiles * 5.0 ) ).xy);
			float3 Normals84 = BlendNormals( UnpackScaleNormal( tex2D( _NormalMap, panner72 ), _NormalStrength ) , UnpackScaleNormal( tex2D( _NormalMap, panner73 ), _NormalStrength ) );
			o.Normal = Normals84;
			float2 panner175 = ( 1.0 * _Time.y * float2( -0.1,0.1 ) + ( WorldSpaceTile11 * 0.2 ).xy);
			float simplePerlin2D176 = snoise( panner175 );
			float clampResult178 = clamp( ( tex2D( _SeaFoam, ( ( WorldSpaceTile11 / 10.0 ) * _SeaFoamTile ).xy ).r * simplePerlin2D176 ) , 0.0 , 1.0 );
			float SeaFoam103 = clampResult178;
			float temp_output_5_0 = ( _Time.y * _WaveSpeed );
			float4 WaveTileUV21 = ( ( WorldSpaceTile11 * float4( _WaveStretch, 0.0 , 0.0 ) ) * _WaveTile );
			float2 panner3 = ( temp_output_5_0 * _WaveDirection + WaveTileUV21.xy);
			float simplePerlin2D1 = snoise( panner3 );
			float2 panner24 = ( temp_output_5_0 * _WaveDirection + ( WaveTileUV21 * float4( 0.1,0.1,0,0 ) ).xy);
			float simplePerlin2D25 = snoise( panner24 );
			float temp_output_27_0 = ( simplePerlin2D1 + simplePerlin2D25 );
			float WavePattern32 = temp_output_27_0;
			float clampResult49 = clamp( WavePattern32 , 0.0 , 1.0 );
			float4 lerpResult47 = lerp( _WaterColor , ( _TopColor + SeaFoam103 ) , clampResult49);
			float4 WaterAlbedo52 = lerpResult47;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float4 screenColor125 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( float3( (ase_grabScreenPosNorm).xy ,  0.0 ) + ( _RefractAmount * Normals84 ) ).xy);
			float4 clampResult126 = clamp( screenColor125 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 Refraction127 = clampResult126;
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float screenDepth130 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth130 = abs( ( screenDepth130 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _WaterDepth ) );
			float clampResult132 = clamp( ( 1.0 - distanceDepth130 ) , 0.0 , 1.0 );
			float Depth133 = clampResult132;
			float4 lerpResult134 = lerp( WaterAlbedo52 , Refraction127 , Depth133);
			o.Albedo = lerpResult134.rgb;
			float screenDepth55 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth55 = abs( ( screenDepth55 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _EdgeDistance ) );
			float4 clampResult62 = clamp( ( _EdgePower * ( ( 1.0 - distanceDepth55 ) + tex2D( _SeaFoam, ( ( WorldSpaceTile11 / 10.0 ) * _EdgeFoamTile ).xy ) ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 Edge60 = clampResult62;
			o.Emission = Edge60.rgb;
			o.Smoothness = _Smoothness;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
1;1081;1918;1026;5210.44;2735.592;2.181634;True;False
Node;AmplifyShaderEditor.CommentaryNode;12;-2546.188,-1144.112;Inherit;False;768.3021;303.6151;;3;9;10;11;World Space UVs;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;9;-2496.187,-1094.112;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;10;-2258.788,-1093.497;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;-2032.143,-1086.111;Inherit;False;WorldSpaceTile;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;23;-4057.043,-2393.482;Inherit;False;1328.983;447.6954;Comment;6;21;16;14;17;13;15;WaveTileUV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;85;-2630.673,-2597.947;Inherit;False;2539.854;1244.464;Comment;21;73;80;79;72;78;71;69;77;65;75;70;74;66;44;68;67;82;83;84;106;107;Normal Map;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;13;-4007.043,-2343.482;Inherit;False;11;WorldSpaceTile;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;67;-2622.662,-2456.925;Inherit;True;11;WorldSpaceTile;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-2539.532,-2220.207;Inherit;False;Constant;_Float2;Float 2;15;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;15;-3997.915,-2127.357;Inherit;False;Property;_WaveStretch;Wave Stretch;13;0;Create;True;0;0;False;0;0.5,0.1;0.5,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-3690.634,-2315.987;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;106;-2295.293,-2363.281;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-1903.479,-2244.969;Inherit;True;Property;_NormalSpeed;Normal Speed;5;0;Create;True;0;0;False;0;0.1;0.1;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;69;-2550.086,-2044.036;Inherit;True;Property;_NormalTiles;NormalTiles;3;0;Create;True;0;0;False;0;0.3;0.3;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-3687.954,-2064.479;Inherit;False;Property;_WaveTile;Wave Tile;15;0;Create;True;0;0;False;0;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;74;-1935.609,-2547.947;Inherit;False;Constant;_PanDirecton1;Pan Directon 1;11;0;Create;True;0;0;False;0;1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-2068.786,-2228.944;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1587.143,-1976.399;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;75;-1796.392,-1534.067;Inherit;False;Constant;_PanDirecton2;Pan Directon 2;11;0;Create;True;0;0;False;0;-1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;-2130.624,-1793.726;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-3364.322,-2275.65;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;179;-2765.107,1414.719;Inherit;False;1885.382;1016.779;Comment;13;168;174;170;173;171;169;175;172;167;176;177;178;103;Sea Foam;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;168;-2715.107,1501.352;Inherit;True;11;WorldSpaceTile;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;64;-4303.096,-121.8643;Inherit;False;1684.79;706.1415;Comment;13;29;30;24;8;7;5;25;3;4;22;1;32;27;Wave Pattern;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;174;-2451.459,2173.499;Inherit;True;Constant;_FoamMask;FoamMask;17;0;Create;True;0;0;False;0;0.2;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;170;-2532.303,1713.718;Inherit;True;Constant;_Float1;Float 1;15;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-1820.353,-1812.84;Inherit;True;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-1619.323,-2381.137;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;21;-2987.155,-2314.681;Inherit;False;WaveTileUV;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;-1484.604,-1738.245;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;7;-4253.055,266.3314;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;169;-2324.624,1493.264;Inherit;True;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.CommentaryNode;96;-2559.439,552.4452;Inherit;False;1330.572;733.5264;;8;94;90;88;95;91;87;93;92;Edge Foam;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-4254.334,372.3242;Inherit;False;Property;_WaveSpeed;Wave Speed;14;0;Create;True;0;0;False;0;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;-2205.015,2050.104;Inherit;True;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PannerNode;73;-1299.044,-1847.84;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;65;-2175.559,-2051.47;Inherit;True;Property;_NormalMap;Normal Map;2;0;Create;True;0;0;False;0;None;018062a34107f1046b037c1a0c412709;True;white;Auto;Texture2D;-1;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;83;-1392.342,-2104.967;Inherit;True;Property;_NormalStrength;Normal Strength;4;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;72;-1384.872,-2365.513;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;29;-4221.18,483.0893;Inherit;False;21;WaveTileUV;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;171;-2266.922,1736.603;Inherit;True;Property;_SeaFoamTile;Sea Foam Tile;8;0;Create;True;0;0;False;0;1;1;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;66;-1020.815,-1966.462;Inherit;True;Property;_TextureSample0;Texture Sample 0;6;0;Create;True;0;0;False;0;-1;None;018062a34107f1046b037c1a0c412709;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;4;-4029.891,99.56842;Inherit;False;Property;_WaveDirection;Wave Direction;12;0;Create;True;0;0;False;0;1,0;1,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TexturePropertyNode;87;-2237.281,628.2327;Inherit;True;Property;_SeaFoam;Sea Foam;7;0;Create;True;0;0;False;0;None;fc746bcd5585ddf4db130569d5791f8e;False;white;Auto;Texture2D;-1;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-3938.84,421.2011;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0.1,0.1,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.PannerNode;175;-1963.152,2087.653;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.1,0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;22;-4044.333,-34.59301;Inherit;False;21;WaveTileUV;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;44;-1015.933,-2193.342;Inherit;True;Property;_Normal;Normal;6;0;Create;True;0;0;False;0;-1;None;018062a34107f1046b037c1a0c412709;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-3994.548,294.7701;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;172;-2045.962,1588.26;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SamplerNode;167;-1863.823,1510.445;Inherit;True;Property;_TextureSample3;Texture Sample 3;19;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;24;-3712.474,219.3308;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BlendNormalsNode;82;-586.8198,-2046.315;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;176;-1843.748,1808.433;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;3;-3746.773,32.85621;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;94;-2509.438,1068.904;Inherit;False;Constant;_Float0;Float 0;15;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;90;-2496.18,830.089;Inherit;True;11;WorldSpaceTile;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;25;-3461.522,256.3326;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;129;-1922.902,-682.3633;Inherit;False;1596.865;646.0999;Comment;9;126;127;122;124;120;125;119;121;123;Refraction;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;116;-2438.492,56.59968;Inherit;False;2065.124;380.1428;Comment;7;62;60;58;59;57;55;56;Edge;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;84;-333.8198,-2043.315;Inherit;False;Normals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;177;-1556.263,1661.124;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;1;-3483.289,-18.91339;Inherit;True;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;93;-2160.802,852.6658;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-2388.492,178.7425;Inherit;True;Property;_EdgeDistance;Edge Distance;11;0;Create;True;0;0;False;0;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;123;-1861.502,-151.2635;Inherit;False;84;Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;138;-1616.381,-1137.767;Inherit;False;1351.944;333.821;Comment;5;131;130;137;132;133;Depth;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-3112.996,-6.534875;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;119;-1872.902,-632.3633;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;92;-2259.541,1043.393;Inherit;True;Property;_EdgeFoamTile;Edge Foam Tile;9;0;Create;True;0;0;False;0;2;2;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;178;-1349.855,1533.094;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-1859.602,-403.2638;Inherit;True;Property;_RefractAmount;Refract Amount;17;0;Create;True;0;0;False;0;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;53;-3978.264,-1875.558;Inherit;False;1269.309;562.0631;;8;105;48;46;104;49;47;52;45;WaterAlbedo;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;32;-2853.157,-8.381058;Inherit;False;WavePattern;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-1576.273,-1049.298;Inherit;True;Property;_WaterDepth;Water Depth;18;0;Create;True;0;0;False;0;15;15;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;103;-1122.725,1476.362;Inherit;True;SeaFoam;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;122;-1597.603,-324.2637;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DepthFade;55;-2068.621,122.4873;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;91;-1971.493,838.2059;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ComponentMaskNode;120;-1574.603,-589.2635;Inherit;True;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;105;-3862.635,-1430.158;Inherit;False;103;SeaFoam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;88;-1728.43,692.0375;Inherit;True;Property;_TextureSample1;Texture Sample 1;15;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;46;-3878.056,-1639.119;Inherit;False;Property;_TopColor;Top Color;1;0;Create;True;0;0;False;0;0.2117647,0.5176471,0.4980392,0;0.2117647,0.5176471,0.4980392,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;124;-1280.603,-426.2638;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;147;-4264.439,-622.765;Inherit;False;975.999;398.7525;Comment;6;140;141;139;142;145;18;Tesselation;1,1,1,1;0;0
Node;AmplifyShaderEditor.DepthFade;130;-1268.596,-1040.191;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;144;-3909.997,-1186.071;Inherit;False;1177.787;499.0695;Comment;5;19;20;34;35;33;Wave Height;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-3607.039,-1446.598;Inherit;False;32;WavePattern;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;57;-1797.274,168.7238;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-3870.219,-855.4143;Inherit;False;Property;_WaveHeight;Wave Height;16;0;Create;True;0;0;False;0;0.3;0.3;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;19;-3859.997,-1136.07;Inherit;False;Constant;_WaveUp;Wave Up;4;0;Create;True;0;0;False;0;0,0.5,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;45;-3914.816,-1822.786;Inherit;False;Property;_WaterColor;Water Color;0;0;Create;True;0;0;False;0;0.09803922,0.3686275,0.4352941,0;0.09803922,0.3686275,0.4352941,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-4197.188,-572.765;Inherit;False;Constant;_Tesselation;Tesselation;4;0;Create;True;0;0;False;0;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-1533.242,135.4636;Inherit;True;Property;_EdgePower;Edge Power;10;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;95;-1398.65,617.4711;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;137;-1011.367,-1033.748;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;125;-1030.203,-416.2638;Inherit;False;Global;_GrabScreen0;Grab Screen 0;17;0;Create;True;0;0;False;0;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;104;-3524.797,-1703.909;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;49;-3400.649,-1607.89;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;-1151.005,172.4473;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;145;-3967.186,-550.2872;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;132;-797.4385,-1056.946;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-3566.801,-1033.306;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;126;-836.972,-417.3363;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;47;-3186.746,-1797.842;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-4210.438,-459.0129;Inherit;False;Constant;_MinDistance;Min Distance;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-4214.438,-339.0124;Inherit;False;Constant;_MaxDistance;Max Distance;4;0;Create;True;0;0;False;0;80;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;-569.0381,-407.4595;Inherit;False;Refraction;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DistanceBasedTessNode;139;-3821.442,-487.0132;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ClampOpNode;62;-902.7591,133.1252;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;133;-507.4397,-1025.946;Inherit;False;Depth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-3214.467,-905.3523;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;52;-2962.882,-1774.763;Inherit;True;WaterAlbedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;142;-3531.442,-460.0132;Inherit;False;Tesselation;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;136;-52.07388,-268.3896;Inherit;False;133;Depth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;-79.64936,-491.6922;Inherit;True;127;Refraction;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;54;-87.37569,-722.8541;Inherit;True;52;WaterAlbedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;35;-3017.885,-1089.339;Inherit;False;WaveHeight;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;60;-616.3691,106.5997;Inherit;True;Edge;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;114.7881,-155.9675;Inherit;False;84;Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;62.89573,158.0335;Inherit;False;35;WaveHeight;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;41;31.90029,56.16445;Inherit;False;Property;_Smoothness;Smoothness;6;0;Create;True;0;0;False;0;0.85;0.85;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;52.43211,282.2786;Inherit;False;142;Tesselation;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;61;40.63654,-56.30492;Inherit;False;60;Edge;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;134;251.8738,-348.3108;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;424.5829,-126.0853;Float;False;True;-1;6;ASEMaterialInspector;0;0;Standard;CVR_VFX_Shaders/Water_Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;9;1
WireConnection;10;1;9;3
WireConnection;11;0;10;0
WireConnection;14;0;13;0
WireConnection;14;1;15;0
WireConnection;106;0;67;0
WireConnection;106;1;107;0
WireConnection;68;0;106;0
WireConnection;68;1;69;0
WireConnection;79;0;77;0
WireConnection;70;0;69;0
WireConnection;16;0;14;0
WireConnection;16;1;17;0
WireConnection;71;0;68;0
WireConnection;71;1;70;0
WireConnection;78;0;74;0
WireConnection;78;1;77;0
WireConnection;21;0;16;0
WireConnection;80;0;75;0
WireConnection;80;1;79;0
WireConnection;169;0;168;0
WireConnection;169;1;170;0
WireConnection;173;0;168;0
WireConnection;173;1;174;0
WireConnection;73;0;71;0
WireConnection;73;2;80;0
WireConnection;72;0;68;0
WireConnection;72;2;78;0
WireConnection;66;0;65;0
WireConnection;66;1;73;0
WireConnection;66;5;83;0
WireConnection;30;0;29;0
WireConnection;175;0;173;0
WireConnection;44;0;65;0
WireConnection;44;1;72;0
WireConnection;44;5;83;0
WireConnection;5;0;7;0
WireConnection;5;1;8;0
WireConnection;172;0;169;0
WireConnection;172;1;171;0
WireConnection;167;0;87;0
WireConnection;167;1;172;0
WireConnection;24;0;30;0
WireConnection;24;2;4;0
WireConnection;24;1;5;0
WireConnection;82;0;44;0
WireConnection;82;1;66;0
WireConnection;176;0;175;0
WireConnection;3;0;22;0
WireConnection;3;2;4;0
WireConnection;3;1;5;0
WireConnection;25;0;24;0
WireConnection;84;0;82;0
WireConnection;177;0;167;1
WireConnection;177;1;176;0
WireConnection;1;0;3;0
WireConnection;93;0;90;0
WireConnection;93;1;94;0
WireConnection;27;0;1;0
WireConnection;27;1;25;0
WireConnection;178;0;177;0
WireConnection;32;0;27;0
WireConnection;103;0;178;0
WireConnection;122;0;121;0
WireConnection;122;1;123;0
WireConnection;55;0;56;0
WireConnection;91;0;93;0
WireConnection;91;1;92;0
WireConnection;120;0;119;0
WireConnection;88;0;87;0
WireConnection;88;1;91;0
WireConnection;124;0;120;0
WireConnection;124;1;122;0
WireConnection;130;0;131;0
WireConnection;57;0;55;0
WireConnection;95;0;57;0
WireConnection;95;1;88;0
WireConnection;137;0;130;0
WireConnection;125;0;124;0
WireConnection;104;0;46;0
WireConnection;104;1;105;0
WireConnection;49;0;48;0
WireConnection;58;0;59;0
WireConnection;58;1;95;0
WireConnection;145;0;33;0
WireConnection;145;1;18;0
WireConnection;132;0;137;0
WireConnection;20;0;19;0
WireConnection;20;1;33;0
WireConnection;126;0;125;0
WireConnection;47;0;45;0
WireConnection;47;1;104;0
WireConnection;47;2;49;0
WireConnection;127;0;126;0
WireConnection;139;0;145;0
WireConnection;139;1;140;0
WireConnection;139;2;141;0
WireConnection;62;0;58;0
WireConnection;133;0;132;0
WireConnection;34;0;20;0
WireConnection;34;1;27;0
WireConnection;52;0;47;0
WireConnection;142;0;139;0
WireConnection;35;0;34;0
WireConnection;60;0;62;0
WireConnection;134;0;54;0
WireConnection;134;1;128;0
WireConnection;134;2;136;0
WireConnection;0;0;134;0
WireConnection;0;1;86;0
WireConnection;0;2;61;0
WireConnection;0;4;41;0
WireConnection;0;11;36;0
WireConnection;0;14;143;0
ASEEND*/
//CHKSM=FA9C9E4B04E49EC79B9C7226E912D2230C15DC19