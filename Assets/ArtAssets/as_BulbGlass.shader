// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "as_BulbGlass"
{
	Properties
	{
		_topgloss("topgloss", Float) = 0
		_gloss("gloss", Range( 0 , 1)) = 0
		_bias("bias", Float) = 0
		_scale("scale", Float) = 1
		_power("power", Float) = 5
		[HDR]_Color("Color", Color) = (0,0,0,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha noshadow exclude_path:deferred 
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float3 worldRefl;
			INTERNAL_DATA
		};

		uniform float4 _Color;
		uniform float _bias;
		uniform float _scale;
		uniform float _power;
		uniform float _topgloss;
		uniform float _gloss;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV6 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode6 = ( _bias + _scale * pow( 1.0 - fresnelNdotV6, _power ) );
			float clampResult12 = clamp( ( 1.0 - fresnelNode6 ) , 0.05 , 1.0 );
			float3 ase_worldReflection = i.worldRefl;
			float clampResult18 = clamp( ( ase_worldReflection.y * _topgloss ) , 0.0 , 0.2 );
			float4 clampResult26 = clamp( ( ( _Color * clampResult12 ) + clampResult18 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			o.Emission = clampResult26.rgb;
			o.Smoothness = _gloss;
			float clampResult16 = clamp( fresnelNode6 , 0.0 , 1.0 );
			float clampResult25 = clamp( ( _Color.a * ( clampResult16 + clampResult18 ) ) , 0.0 , 1.0 );
			o.Alpha = clampResult25;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
0;73;1485;406;897.9622;257.8986;1.793396;True;False
Node;AmplifyShaderEditor.RangedFloatNode;9;-488.2798,524.1366;Inherit;False;Property;_power;power;4;0;Create;True;0;0;False;0;5;2.78;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-475.8836,424.9668;Inherit;False;Property;_scale;scale;3;0;Create;True;0;0;False;0;1;1.88;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-478.6383,342.3257;Inherit;False;Property;_bias;bias;2;0;Create;True;0;0;False;0;0;0.64;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldReflectionVector;17;114.9598,475.1337;Inherit;False;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;20;163.3763,633.74;Inherit;False;Property;_topgloss;topgloss;0;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;6;-248.6203,305.1373;Inherit;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;438.8506,508.5245;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;11;157.8244,221.5988;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;16;527.336,304.8405;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;12;402.4094,169.4881;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.05;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;18;653.7512,500.0464;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;10;-120.3012,-161.9604;Inherit;False;Property;_Color;Color;5;1;[HDR];Create;True;0;0;False;0;0,0,0,0;3.688605,1.235973,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;22;933.7015,301.7561;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;715.4989,3.319489;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;21;977.031,130.4061;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;1092.542,209.4173;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;122.6918,58.31954;Inherit;False;Property;_gloss;gloss;1;0;Create;True;0;0;False;0;0;0.8;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;26;1285.714,-12.61892;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;25;1312.539,249.4355;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1567.317,-17.36193;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;as_BulbGlass;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;1;7;0
WireConnection;6;2;8;0
WireConnection;6;3;9;0
WireConnection;19;0;17;2
WireConnection;19;1;20;0
WireConnection;11;0;6;0
WireConnection;16;0;6;0
WireConnection;12;0;11;0
WireConnection;18;0;19;0
WireConnection;22;0;16;0
WireConnection;22;1;18;0
WireConnection;13;0;10;0
WireConnection;13;1;12;0
WireConnection;21;0;13;0
WireConnection;21;1;18;0
WireConnection;27;0;10;4
WireConnection;27;1;22;0
WireConnection;26;0;21;0
WireConnection;25;0;27;0
WireConnection;0;2;26;0
WireConnection;0;4;14;0
WireConnection;0;9;25;0
ASEEND*/
//CHKSM=05F3A8F6ED823E5EACDB61311A59436E8FB5236A