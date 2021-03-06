// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_VC_standard"
{
	Properties
	{
		_gloss("gloss", Range( 0 , 1)) = 0
		_emissive("emissive", Range( 0 , 1)) = 0
		_metallic("metallic", Range( 0 , 1)) = 0
		_MainTex("MainTex", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
			float2 uv_texcoord;
		};

		uniform float4 _Color;
		uniform float _emissive;
		uniform float _metallic;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _gloss;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = ( _Color * i.vertexColor ).rgb;
			o.Emission = ( i.vertexColor * _emissive ).rgb;
			float temp_output_3_0 = _metallic;
			o.Metallic = temp_output_3_0;
			float2 uv0_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode6 = tex2D( _MainTex, uv0_MainTex );
			o.Smoothness = ( tex2DNode6.a * _gloss );
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
0;73;1379;507;1359.153;423.853;1.651555;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-829.0041,-321.4563;Inherit;False;0;6;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;1;-382.5,-102.5;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-296.8249,311.09;Inherit;False;Property;_emissive;emissive;1;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-464.8305,190.4986;Inherit;False;Property;_gloss;gloss;0;0;Create;True;0;0;False;0;0;0.675;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;6;-478.4576,-328.7502;Inherit;True;Property;_MainTex;MainTex;3;0;Create;True;0;0;False;0;-1;None;67a045cb7a02c1d4daba427370a8f9f0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;10;-346.7504,-501.4757;Inherit;False;Property;_Color;Color;4;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-436.0302,92.09875;Inherit;False;Property;_metallic;metallic;2;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;229.2406,189.2543;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-47.49365,176.5171;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;94.21486,60.05286;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;92.56323,-266.9553;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;564.3121,-40.1168;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_VC_standard;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;1;9;0
WireConnection;4;0;1;0
WireConnection;4;1;5;0
WireConnection;7;0;6;4
WireConnection;7;1;2;0
WireConnection;8;0;6;1
WireConnection;8;1;3;0
WireConnection;11;0;10;0
WireConnection;11;1;1;0
WireConnection;0;0;11;0
WireConnection;0;2;4;0
WireConnection;0;3;3;0
WireConnection;0;4;7;0
WireConnection;0;5;1;1
ASEEND*/
//CHKSM=CCA7B48B1DE56AC4954F9C1FE46F1AFA950BF340