// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_Bulb"
{
	Properties
	{
		_gloss("gloss", Float) = 0
		_glow("glow", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float4 vertexColor : COLOR;
		};

		uniform float _glow;
		uniform float _gloss;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 lerpResult21 = lerp( i.vertexColor , float4( 0,0,0,0 ) , i.vertexColor.b);
			o.Albedo = lerpResult21.rgb;
			float4 temp_output_20_0 = ( i.vertexColor * _glow );
			float4 lerpResult17 = lerp( temp_output_20_0 , float4( 0,0,0,0 ) , i.vertexColor.a);
			o.Emission = lerpResult17.rgb;
			o.Smoothness = _gloss;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
0;73;1485;406;997.318;326.2524;1.690905;True;False
Node;AmplifyShaderEditor.VertexColorNode;1;-436.3492,-64.4968;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;15;118.8206,193.2031;Inherit;False;Property;_glow;glow;2;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;302.2315,-114.4716;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;10;-68.10184,-305.6197;Inherit;False;Property;_Color;Color;6;1;[HDR];Create;True;0;0;False;0;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;7;-478.6383,342.3257;Inherit;False;Property;_bias;bias;3;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-488.2798,524.1366;Inherit;False;Property;_power;power;5;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-475.8836,424.9668;Inherit;False;Property;_scale;scale;4;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-263.2488,180.6961;Inherit;False;Property;_emissive;emissive;0;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;3;-273.4126,95.77935;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;6;-248.6203,305.1373;Inherit;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-66.8587,123.2283;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;868.8914,202.0961;Inherit;False;Property;_gloss;gloss;1;0;Create;True;0;0;False;0;0;0.59;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;581.9927,-182.8864;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;17;796.5192,53.54702;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;21;786.4307,-80.32629;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1150.219,-31.44871;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_Bulb;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;20;0;1;0
WireConnection;20;1;15;0
WireConnection;3;0;1;4
WireConnection;6;1;7;0
WireConnection;6;2;8;0
WireConnection;6;3;9;0
WireConnection;2;0;3;0
WireConnection;2;1;4;0
WireConnection;19;0;20;0
WireConnection;19;1;10;0
WireConnection;17;0;20;0
WireConnection;17;2;1;4
WireConnection;21;0;1;0
WireConnection;21;2;1;3
WireConnection;0;0;21;0
WireConnection;0;2;17;0
WireConnection;0;4;14;0
ASEEND*/
//CHKSM=CBA37640936B413B13BDAF9D098E9741CB2A18D1