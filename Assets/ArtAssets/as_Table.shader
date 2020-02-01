// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_Table"
{
	Properties
	{
		_Emission("Emission", Range( 0 , 1)) = 0
		_Metal("Metal", Range( 0 , 1)) = 0
		_MainTex("MainTex", 2D) = "white" {}
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
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float _Emission;
		uniform float _Metal;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 tex2DNode5 = tex2D( _MainTex, uv_MainTex );
			o.Albedo = tex2DNode5.rgb;
			float4 lerpResult4 = lerp( float4( 0,0,0,0 ) , tex2DNode5 , _Emission);
			o.Emission = lerpResult4.rgb;
			o.Metallic = _Metal;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
16;44;1182;546;1086.573;412.227;1.939795;True;True
Node;AmplifyShaderEditor.SamplerNode;5;-496.8754,-330.7556;Inherit;True;Property;_MainTex;MainTex;2;0;Create;True;0;0;False;0;-1;None;ba80ae9107d6c994f823a1baaebfb2a0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;3;-378.7937,419.7919;Inherit;False;Property;_Emission;Emission;0;0;Create;True;0;0;False;0;0;0.09;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;4;32.97614,363.9776;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-388.2467,237.6043;Inherit;False;Property;_Metal;Metal;1;0;Create;True;0;0;False;0;0;0.09;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;350.2835,-90.20412;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_Table;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;1;5;0
WireConnection;4;2;3;0
WireConnection;0;0;5;0
WireConnection;0;2;4;0
WireConnection;0;3;6;0
ASEEND*/
//CHKSM=A2B6B18EBF35B9013F855E1006FE99517AF3BB40