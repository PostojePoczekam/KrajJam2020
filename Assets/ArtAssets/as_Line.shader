// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_Line"
{
	Properties
	{
		_uvspeed("uv speed", Vector) = (0,0,0,0)
		_MainTex("MainTex", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows dithercrossfade 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTex;
		uniform float2 _uvspeed;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 panner21 = ( 1.0 * _Time.y * _uvspeed + i.uv_texcoord);
			float4 tex2DNode20 = tex2D( _MainTex, panner21 );
			o.Albedo = tex2DNode20.rgb;
			o.Smoothness = tex2DNode20.a;
			o.Occlusion = 1.0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
0;73;1379;507;767.808;656.3773;1.712959;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;23;-458.0991,-533.4893;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;25;-437.8923,-339.224;Inherit;False;Property;_uvspeed;uv speed;6;0;Create;True;0;0;False;0;0,0;0,0.05;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TexturePropertyNode;27;-39.58631,-630.8212;Inherit;True;Property;_MainTex;MainTex;7;0;Create;True;0;0;False;0;None;ce44ae5312d70b14db6eb2d2a58c9bcc;False;white;Auto;Texture2D;-1;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.PannerNode;21;3.117408,-426.4752;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;7;-525.2814,383.9193;Inherit;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;97.60847,10.55594;Inherit;False;Property;_fade;fade;0;0;Create;True;0;0;False;0;0;-0.14;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;337.636,-77.56449;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;285.5019,42.82025;Inherit;False;Property;_fadeMultiply;fade Multiply;1;0;Create;True;0;0;False;0;0;3.45;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;496.6929,-60.9803;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;18;685.3387,-69.17274;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.3;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;20;316.7079,-484.317;Inherit;True;Property;_TextureSample0;Texture Sample 0;7;0;Create;True;0;0;False;0;-1;None;8a76673dd23a03342921ddadc627928d;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;48.15039,89.18874;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DepthFade;12;-319.2251,-155.646;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-152.0786,502.9282;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;409.2549,131.7685;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-794.4346,357.82;Inherit;False;Property;_bias;bias;5;0;Create;True;0;0;False;0;0;0.23;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;980.8093,100.9153;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PosVertexDataNode;29;214.3306,-226.8525;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;5;-485.4521,154.7905;Inherit;False;Property;_Color;Color;2;0;Create;True;0;0;False;0;0,0,0,0;0.3329999,0.2319106,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;1;-655.4684,-60.57558;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;925.2428,-47.91812;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;17;680.1497,213.2114;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-793.4346,441.82;Inherit;False;Property;_scale;scale;3;0;Create;True;0;0;False;0;1;0.93;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;932.6251,-188.7491;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldPosInputsNode;31;-20.4,-187.7898;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;15;-792.4346,531.82;Inherit;False;Property;_power;power;4;0;Create;True;0;0;False;0;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;1212.373,-56.8418;Inherit;False;Constant;_Float0;Float 0;8;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;19;307.726,417.2809;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;10;64.14638,410.4044;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1390.339,-210.8134;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_Line;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;1;False;-1;1;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;21;0;23;0
WireConnection;21;2;25;0
WireConnection;7;1;16;0
WireConnection;7;2;14;0
WireConnection;7;3;15;0
WireConnection;30;0;31;2
WireConnection;30;1;2;0
WireConnection;33;0;30;0
WireConnection;33;1;32;0
WireConnection;18;0;33;0
WireConnection;20;0;27;0
WireConnection;20;1;21;0
WireConnection;6;0;1;0
WireConnection;6;1;5;0
WireConnection;6;2;12;0
WireConnection;12;0;2;0
WireConnection;9;0;7;0
WireConnection;8;0;6;0
WireConnection;8;1;19;0
WireConnection;22;0;20;0
WireConnection;22;1;8;0
WireConnection;26;0;20;0
WireConnection;26;1;8;0
WireConnection;17;0;8;0
WireConnection;17;1;10;0
WireConnection;28;0;20;0
WireConnection;28;1;18;0
WireConnection;19;0;10;0
WireConnection;10;0;7;0
WireConnection;0;0;20;0
WireConnection;0;4;20;4
WireConnection;0;5;34;0
ASEEND*/
//CHKSM=FBEA358CBC3E920B0ECB42038510040E13EED497