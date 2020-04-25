// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CVR_VFX_Shaders/CVR_VFX_FloatingGlass"
{
	Properties
	{
		_FallOffIntensity("Fall Off Intensity", Range( 0 , 1)) = 0.5
		_FallOffAmount("Fall Off Amount", Range( 0 , 1)) = 0.5
		_FallOffColor("Fall Off Color", Color) = (0,0,0,0)
		_Color("Color", Color) = (0,0,0,0)
		_Albedo("Albedo", 2D) = "white" {}
		_SpacularIntensity("Spacular Intensity", Range( 0 , 1)) = 0.5
		_SpacularPower("Spacular Power", Range( 0 , 1)) = 0.5
		_Emission("Emission", 2D) = "bump" {}
		_Normal("Normal", 2D) = "bump" {}
		_Alpha("Alpha", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 worldNormal;
			INTERNAL_DATA
			float3 worldPos;
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
		uniform sampler2D _Alpha;
		uniform float4 _Alpha_ST;
		uniform float _SpacularIntensity;
		uniform float _SpacularPower;
		uniform float4 _Color;
		uniform sampler2D _Albedo;
		uniform float4 _FallOffColor;
		uniform float _FallOffAmount;
		uniform float _FallOffIntensity;
		uniform sampler2D _Normal;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 uv_Alpha = i.uv_texcoord * _Alpha_ST.xy + _Alpha_ST.zw;
			float4 Alpha92 = ( (1.0 + (0.0 - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) * tex2D( _Alpha, uv_Alpha ) );
			SurfaceOutputStandard s78 = (SurfaceOutputStandard ) 0;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float dotResult19 = dot( ase_worldViewDir , ase_worldlightDir );
			float View_Light_Dir46 = dotResult19;
			float Specular50 = ( _SpacularIntensity * pow( View_Light_Dir46 , exp( ( (1.0 + (_SpacularPower - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) * 8.0 ) ) ) );
			float2 panner54 = ( 1.0 * _Time.y * float2( 0,0.1 ) + i.uv_texcoord);
			float2 UV_Panning62 = panner54;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float dotResult20 = dot( ase_worldlightDir , ase_worldNormal );
			float temp_output_22_0 = ( ( dotResult20 + 0.5 ) * 0.5 );
			float World_Driection25 = ( temp_output_22_0 * temp_output_22_0 );
			float4 temp_output_29_0 = ( _Color * tex2D( _Albedo, UV_Panning62 ) * World_Driection25 );
			float fresnelNdotV8 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode8 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV8, ( _FallOffAmount * 5.0 ) ) );
			float Fresnel15 = ( fresnelNode8 * ( _FallOffIntensity * 20.0 ) );
			#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
			float4 ase_lightColor = 0;
			#else //aselc
			float4 ase_lightColor = _LightColor0;
			#endif //aselc
			s78.Albedo = ( ( Specular50 + temp_output_29_0 + ( temp_output_29_0 * _FallOffColor * Fresnel15 ) ) * ase_lightColor ).rgb;
			float3 Normal68 = UnpackNormal( tex2D( _Normal, UV_Panning62 ) );
			s78.Normal = WorldNormalVector( i , Normal68 );
			s78.Emission = float3( 0,0,0 );
			s78.Metallic = 0.0;
			s78.Smoothness = 0.0;
			s78.Occlusion = 1.0;

			data.light = gi.light;

			UnityGI gi78 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g78 = UnityGlossyEnvironmentSetup( s78.Smoothness, data.worldViewDir, s78.Normal, float3(0,0,0));
			gi78 = UnityGlobalIllumination( data, s78.Occlusion, s78.Normal, g78 );
			#endif

			float3 surfResult78 = LightingStandard ( s78, viewDir, gi78 ).rgb;
			surfResult78 += s78.Emission;

			#ifdef UNITY_PASS_FORWARDADD//78
			surfResult78 -= s78.Emission;
			#endif//78
			float3 Albedo37 = surfResult78;
			c.rgb = Albedo37;
			c.a = Alpha92.r;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float2 panner54 = ( 1.0 * _Time.y * float2( 0,0.1 ) + i.uv_texcoord);
			float4 color60 = IsGammaSpace() ? float4(0.5,0.5,0.5,0) : float4(0.2140411,0.2140411,0.2140411,0);
			float4 Emission69 = ( float4( UnpackNormal( tex2D( _Emission, panner54 ) ) , 0.0 ) * color60 );
			o.Emission = Emission69.rgb;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting alpha:fade keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT( UnityGI, gi );
				o.Alpha = LightingStandardCustomLighting( o, worldViewDir, gi ).a;
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
7;1087;1906;1014;2159.427;1500.995;2.864074;True;False
Node;AmplifyShaderEditor.CommentaryNode;26;-4000.507,-1138.351;Inherit;False;1697.385;619.596;Comment;11;17;18;19;13;20;21;22;23;24;25;46;World_Driection;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;13;-3937.766,-697.7546;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;51;-4110.413,-1994.628;Inherit;False;1519.951;626.6379;Comment;10;42;44;45;48;50;41;40;43;49;47;Specular;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;18;-3950.507,-894.9022;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;17;-3917.405,-1088.351;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;23;-3493.104,-634.6819;Inherit;False;Constant;_Float2;Float 2;2;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;71;-1757.199,-1787.031;Inherit;False;1094.802;607.7167;Comment;4;54;62;55;53;UV_Panning;1,1,1,1;0;0
Node;AmplifyShaderEditor.DotProductOpNode;20;-3522.841,-825.8676;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-4060.413,-1604.315;Inherit;False;Property;_SpacularPower;Spacular Power;6;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;16;-3795.682,-124.5384;Inherit;False;1557.749;726.5515;Comment;9;10;5;7;6;9;11;8;12;15;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-3641.505,263.4879;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;53;-1707.199,-1577.218;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;21;-3284.061,-820.2088;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-3745.682,132.8015;Inherit;False;Property;_FallOffAmount;Fall Off Amount;1;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-3695.38,-1482.99;Inherit;False;Constant;_Float3;Float 3;6;0;Create;True;0;0;False;0;8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;41;-3723.899,-1722.452;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;19;-3556.605,-1021.002;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;54;-1251.521,-1737.031;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-3061.929,-818.7454;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-3466.808,-1632.66;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-3404.254,371.2813;Inherit;False;Property;_FallOffIntensity;Fall Off Intensity;0;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;46;-3338.106,-1000.292;Inherit;False;View_Light_Dir;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-3405.03,161.8354;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-3390.249,487.0134;Inherit;False;Constant;_Float1;Float 1;1;0;Create;True;0;0;False;0;20;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;62;-905.3958,-1596.779;Inherit;False;UV_Panning;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;47;-3479.063,-1790.038;Inherit;False;46;View_Light_Dir;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-3050.794,359.7052;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-2849.211,-811.0338;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;8;-3202.141,-74.53836;Inherit;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ExpOpNode;44;-3262.69,-1643.747;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;38;-1902.105,-662.1414;Inherit;False;1547.253;709;Comment;15;28;30;27;31;29;33;32;34;35;36;37;52;63;76;78;Albedo;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;45;-3156.287,-1826.607;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-2561.126,-763.3128;Inherit;False;World_Driection;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-2794.437,123.809;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-3714.023,-1944.628;Inherit;False;Property;_SpacularIntensity;Spacular Intensity;5;0;Create;True;0;0;False;0;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;63;-1723.662,-132.4103;Inherit;False;62;UV_Panning;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-2969.778,-1931.198;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;27;-1814.105,-612.1414;Inherit;False;Property;_Color;Color;3;0;Create;True;0;0;False;0;0,0,0,0;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-2480.933,138.4132;Inherit;True;Fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;28;-1736.105,-410.1414;Inherit;True;Property;_Albedo;Albedo;4;0;Create;True;0;0;False;0;-1;None;c1970fdd536af7642a62d44721e49718;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;30;-1404.105,-311.1414;Inherit;False;25;World_Driection;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;72;-343.1066,-2377.85;Inherit;False;956.1412;280;Comment;3;66;67;68;Normal;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-2833.462,-1768.141;Inherit;False;Specular;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-1450.106,-571.1414;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-1041.106,-141.1414;Inherit;False;15;Fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;31;-1308.106,-143.1414;Inherit;False;Property;_FallOffColor;Fall Off Color;2;0;Create;True;0;0;False;0;0,0,0,0;0.5,0.5,0.5,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;67;-293.1066,-2305.315;Inherit;False;62;UV_Panning;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;93;-1407.924,100.3752;Inherit;False;1128.25;457.2972;Comment;5;89;90;88;91;92;Alpha;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1031.105,-320.1414;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;52;-1152.998,-600.0869;Inherit;False;50;Specular;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;66;-9.135498,-2327.85;Inherit;True;Property;_Normal;Normal;10;0;Create;True;0;0;False;0;-1;None;c7e9ae087ac710a4980ed418c192e2fb;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;34;-1008.281,-483.4959;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-1357.924,176.0777;Inherit;False;Constant;_Transparency;Transparency;12;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;73;-417.7659,-1988.255;Inherit;False;1054.395;520.2603;Comment;4;59;60;61;69;Emission;1,1,1,1;0;0
Node;AmplifyShaderEditor.LightColorNode;36;-847.1036,-340.1414;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RegisterLocalVarNode;68;370.0345,-2310.407;Inherit;False;Normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;60;-331.4643,-1674.995;Inherit;False;Constant;_EmissionColor;Emission Color;9;0;Create;True;0;0;False;0;0.5,0.5,0.5,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;59;-367.7659,-1938.255;Inherit;True;Property;_Emission;Emission;8;0;Create;True;0;0;False;0;-1;None;0ec79c3d1dd0fb640b7f3f72ebb28f74;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-817.1031,-501.1414;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;91;-1101.059,327.6722;Inherit;True;Property;_Alpha;Alpha;11;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;89;-1056.726,150.3754;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;76;-868.5277,-67.26929;Inherit;False;68;Normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;61;135.2205,-1740.574;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;90;-723.5436,161.6428;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CustomStandardSurface;78;-635.7682,-315.8981;Inherit;False;Metallic;Tangent;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;69;393.6286,-1739.81;Inherit;False;Emission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;74;-467.9069,-1280.007;Inherit;False;1216.616;312.7119;Comment;5;58;65;70;64;56;Noise;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;37;-570.8492,-477.8177;Inherit;False;Albedo;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;92;-522.675,251.1954;Inherit;False;Alpha;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;505.7096,-1190.356;Inherit;False;Noise;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;283.1981,-1217.677;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;56;-417.907,-1197.864;Inherit;True;Property;_Noise;Noise;7;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;75;214.4723,-416.2693;Inherit;False;69;Emission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;55;-1230.579,-1432.314;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0.2;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;219.0801,-116.595;Inherit;False;37;Albedo;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;98;240.4535,-258.7826;Inherit;False;92;Alpha;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;58;-51.11985,-1230.007;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;65;-86.06931,-1082.295;Inherit;False;Property;_NoiseIntensity;Noise Intensity;9;0;Create;True;0;0;False;0;0;0.5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;100;575.8396,-452.1541;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;CVR_VFX_Shaders/CVR_VFX_FloatingGlass;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;20;0;18;0
WireConnection;20;1;13;0
WireConnection;21;0;20;0
WireConnection;21;1;23;0
WireConnection;41;0;40;0
WireConnection;19;0;17;0
WireConnection;19;1;18;0
WireConnection;54;0;53;0
WireConnection;22;0;21;0
WireConnection;22;1;23;0
WireConnection;42;0;41;0
WireConnection;42;1;43;0
WireConnection;46;0;19;0
WireConnection;7;0;5;0
WireConnection;7;1;6;0
WireConnection;62;0;54;0
WireConnection;10;0;9;0
WireConnection;10;1;11;0
WireConnection;24;0;22;0
WireConnection;24;1;22;0
WireConnection;8;0;13;0
WireConnection;8;3;7;0
WireConnection;44;0;42;0
WireConnection;45;0;47;0
WireConnection;45;1;44;0
WireConnection;25;0;24;0
WireConnection;12;0;8;0
WireConnection;12;1;10;0
WireConnection;48;0;49;0
WireConnection;48;1;45;0
WireConnection;15;0;12;0
WireConnection;28;1;63;0
WireConnection;50;0;48;0
WireConnection;29;0;27;0
WireConnection;29;1;28;0
WireConnection;29;2;30;0
WireConnection;32;0;29;0
WireConnection;32;1;31;0
WireConnection;32;2;33;0
WireConnection;66;1;67;0
WireConnection;34;0;52;0
WireConnection;34;1;29;0
WireConnection;34;2;32;0
WireConnection;68;0;66;0
WireConnection;59;1;54;0
WireConnection;35;0;34;0
WireConnection;35;1;36;0
WireConnection;89;0;88;0
WireConnection;61;0;59;0
WireConnection;61;1;60;0
WireConnection;90;0;89;0
WireConnection;90;1;91;0
WireConnection;78;0;35;0
WireConnection;78;1;76;0
WireConnection;69;0;61;0
WireConnection;37;0;78;0
WireConnection;92;0;90;0
WireConnection;70;0;64;0
WireConnection;64;0;58;0
WireConnection;64;1;65;0
WireConnection;56;1;55;0
WireConnection;55;0;53;0
WireConnection;58;0;56;1
WireConnection;58;1;56;1
WireConnection;100;2;75;0
WireConnection;100;9;98;0
WireConnection;100;13;39;0
ASEEND*/
//CHKSM=F0CD0DBECF6E912A0EF0AC9C466E56DE270D95D4