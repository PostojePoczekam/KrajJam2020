// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_VC_standard"
{
	Properties
	{
		_gloss("gloss", Range( 0 , 1)) = 0
		_emissive("emissive", Range( 0 , 1)) = 0
		_metallic("metallic", Range( 0 , 1)) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 vertexColor : COLOR;
		};

		uniform float _emissive;
		uniform float _metallic;
		uniform float _gloss;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 temp_output_1_0 = i.vertexColor;
			o.Albedo = temp_output_1_0.rgb;
			o.Emission = ( i.vertexColor * _emissive ).rgb;
			o.Metallic = _metallic;
			o.Smoothness = _gloss;
			o.Occlusion = i.vertexColor.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
0;73;1481;460;1559.993;237.1086;1.6512;True;False
Node;AmplifyShaderEditor.VertexColorNode;1;-382.5,-102.5;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-296.8249,311.09;Inherit;False;Property;_emissive;emissive;1;0;Create;True;0;0;False;0;0;0.378;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-436.0302,92.09875;Inherit;False;Property;_metallic;metallic;2;0;Create;True;0;0;False;0;0;0.596;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;229.2406,189.2543;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-464.8305,190.4986;Inherit;False;Property;_gloss;gloss;0;0;Create;True;0;0;False;0;0;0.378;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;564.3121,-40.1168;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_VC_standard;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;1;0
WireConnection;4;1;5;0
WireConnection;0;0;1;0
WireConnection;0;2;4;0
WireConnection;0;3;3;0
WireConnection;0;4;2;0
WireConnection;0;5;1;1
ASEEND*/
//CHKSM=8FB6752000086FF4AD764F16BA64BDC03B5EA8DF