// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_VC_chicken"
{
	Properties
	{
		_gloss("gloss", Range( 0 , 1)) = 0
		_emissive("emissive", Range( 0 , 1)) = 0
		_metallic("metallic", Range( 0 , 1)) = 0
		_MainTex("MainTex", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,0)
		_aoheight("ao height", Float) = 0
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
			float3 worldPos;
		};

		uniform float4 _Color;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _emissive;
		uniform float _metallic;
		uniform float _gloss;
		uniform float _aoheight;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv0_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode6 = tex2D( _MainTex, uv0_MainTex );
			o.Albedo = ( _Color * i.vertexColor * tex2DNode6 ).rgb;
			o.Emission = ( i.vertexColor * _emissive ).rgb;
			o.Metallic = _metallic;
			o.Smoothness = ( tex2DNode6.a * _gloss );
			float3 ase_worldPos = i.worldPos;
			float clampResult16 = clamp( ( ase_worldPos.y + _aoheight ) , 0.0 , 1.0 );
			o.Occlusion = clampResult16;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
0;73;1379;507;1596.12;519.6562;1.951555;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-829.0041,-321.4563;Inherit;False;0;6;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;12;-692.5501,1.408962;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;15;-632.0522,251.208;Inherit;False;Property;_aoheight;ao height;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;1;-382.5,-102.5;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-296.8249,311.09;Inherit;False;Property;_emissive;emissive;1;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-464.8305,190.4986;Inherit;False;Property;_gloss;gloss;0;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;6;-478.4576,-328.7502;Inherit;True;Property;_MainTex;MainTex;3;0;Create;True;0;0;False;0;-1;None;9291785e0f08a2647853f9ebea0b9dc4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;10;-346.7504,-501.4757;Inherit;False;Property;_Color;Color;4;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;14;91.97458,-45.42837;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-436.0302,92.09875;Inherit;False;Property;_metallic;metallic;2;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-47.49365,176.5171;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;92.56323,-266.9553;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;229.2406,189.2543;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;476.4311,-232.7775;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;16;308.5972,-59.08923;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;617.0041,-69.39011;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_VC_chicken;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;1;9;0
WireConnection;14;0;12;2
WireConnection;14;1;15;0
WireConnection;7;0;6;4
WireConnection;7;1;2;0
WireConnection;11;0;10;0
WireConnection;11;1;1;0
WireConnection;11;2;6;0
WireConnection;4;0;1;0
WireConnection;4;1;5;0
WireConnection;13;0;12;2
WireConnection;16;0;14;0
WireConnection;0;0;11;0
WireConnection;0;2;4;0
WireConnection;0;3;3;0
WireConnection;0;4;7;0
WireConnection;0;5;16;0
ASEEND*/
//CHKSM=C2DDD2DF0721F1F4510EDC291606510E4D3CA58B