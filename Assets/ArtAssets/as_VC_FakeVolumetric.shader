// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_FakeVolume"
{
	Properties
	{
		_fade("fade", Range( 0 , 2)) = 0
		_Color("Color", Color) = (0,0,0,0)
		_scale("scale", Float) = 1
		_power("power", Float) = 5
		_bias("bias", Float) = 0
		_uvspeed("uv speed", Vector) = (0,0,0,0)
		_MainTex("MainTex", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Pass
		{
			ColorMask 0
			ZTest Always
			ZWrite On
		}

		Tags{ "RenderType" = "Opaque"  "Queue" = "Overlay+0" "IsEmissive" = "true"  }
		Cull Back
		Offset  -4.4 , -31.26
		Blend One One , One One
		
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float4 screenPos;
			float3 worldPos;
			float3 worldNormal;
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

		uniform sampler2D _MainTex;
		uniform float2 _uvspeed;
		uniform float4 _Color;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _fade;
		uniform float _bias;
		uniform float _scale;
		uniform float _power;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 panner21 = ( 1.0 * _Time.y * _uvspeed + i.uv_texcoord);
			float4 tex2DNode20 = tex2D( _MainTex, panner21 );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float screenDepth12 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth12 = abs( ( screenDepth12 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _fade ) );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV7 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode7 = ( _bias + _scale * pow( 1.0 - fresnelNdotV7, _power ) );
			float clampResult10 = clamp( fresnelNode7 , 0.0 , 1.0 );
			float4 temp_output_8_0 = ( ( i.vertexColor * _Color * distanceDepth12 ) * ( 1.0 - clampResult10 ) );
			float2 panner29 = ( 1.0 * _Time.y * ( _uvspeed * float2( -0.4,-0.3 ) ) + ( i.uv_texcoord * float2( -0.4,-0.3 ) ));
			o.Emission = ( tex2DNode20 * temp_output_8_0 * tex2D( _MainTex, panner29 ) ).rgb;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
0;73;1481;460;850.165;450.0397;1.453467;True;False
Node;AmplifyShaderEditor.RangedFloatNode;15;-792.4346,531.82;Inherit;False;Property;_power;power;4;0;Create;True;0;0;False;0;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-793.4346,441.82;Inherit;False;Property;_scale;scale;3;0;Create;True;0;0;False;0;1;1.28;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-794.4346,357.82;Inherit;False;Property;_bias;bias;5;0;Create;True;0;0;False;0;0;-0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;7;-525.2814,383.9193;Inherit;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-610.365,-154.8716;Inherit;False;Property;_fade;fade;0;0;Create;True;0;0;False;0;0;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;25;-434.4664,-334.0851;Inherit;False;Property;_uvspeed;uv speed;6;0;Create;True;0;0;False;0;0,0;0.005,0.01;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;23;-458.0991,-533.4893;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-193.4051,-280.1682;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.4,-0.3;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DepthFade;12;-319.2251,-155.646;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-205.5525,-423.6119;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-0.4,-0.3;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VertexColorNode;1;-655.4684,-60.57558;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;5;-485.4521,154.7905;Inherit;False;Property;_Color;Color;1;0;Create;True;0;0;False;0;0,0,0,0;0.206,0.1429882,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;10;64.14638,410.4044;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;19;307.726,417.2809;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;27;-60.14182,-629.1082;Inherit;True;Property;_MainTex;MainTex;7;0;Create;True;0;0;False;0;None;8a76673dd23a03342921ddadc627928d;False;white;Auto;Texture2D;-1;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PannerNode;29;0.9761947,-287.0633;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;48.15039,89.18874;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;21;3.117408,-426.4752;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;409.2549,131.7685;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;28;311.5929,-269.6475;Inherit;True;Property;_TextureSample1;Texture Sample 0;6;0;Create;True;0;0;False;0;-1;None;8a76673dd23a03342921ddadc627928d;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;20;316.7079,-484.317;Inherit;True;Property;_TextureSample0;Texture Sample 0;6;0;Create;True;0;0;False;0;-1;None;8a76673dd23a03342921ddadc627928d;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-152.0786,502.9282;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;17;680.1497,213.2114;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;925.2428,-47.91812;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;18;919.35,321.6258;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;980.8093,100.9153;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1177.647,63.76733;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;as_FakeVolume;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;True;-4.4;False;-1;-31.26;False;-1;True;7;Custom;0.5;True;False;0;True;Opaque;;Overlay;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;0;False;-1;0;False;-1;155;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;2;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;1;16;0
WireConnection;7;2;14;0
WireConnection;7;3;15;0
WireConnection;30;0;25;0
WireConnection;12;0;2;0
WireConnection;31;0;23;0
WireConnection;10;0;7;0
WireConnection;19;0;10;0
WireConnection;29;0;31;0
WireConnection;29;2;30;0
WireConnection;6;0;1;0
WireConnection;6;1;5;0
WireConnection;6;2;12;0
WireConnection;21;0;23;0
WireConnection;21;2;25;0
WireConnection;8;0;6;0
WireConnection;8;1;19;0
WireConnection;28;0;27;0
WireConnection;28;1;29;0
WireConnection;20;0;27;0
WireConnection;20;1;21;0
WireConnection;9;0;7;0
WireConnection;17;0;8;0
WireConnection;17;1;10;0
WireConnection;26;0;20;0
WireConnection;26;1;8;0
WireConnection;26;2;28;0
WireConnection;18;0;17;0
WireConnection;22;0;20;0
WireConnection;22;1;8;0
WireConnection;0;2;26;0
ASEEND*/
//CHKSM=E102C72391446C72CA452B5F7AFC233BB2AA7054