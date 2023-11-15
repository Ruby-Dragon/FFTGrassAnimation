using Godot;
using System;

public partial class GrassField : MultiMeshInstance3D
{
	private RenderingDevice ComputeRunner;
	private Rid ComputeShader;
    
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		ComputeRunner = RenderingServer.CreateLocalRenderingDevice();
		var ShaderFile = GD.Load<RDShaderFile>("res://WindStrengthComputeShader.glsl");
		var ShaderByteCode = ShaderFile.GetSpirV();
		ComputeShader = ComputeRunner.ShaderCreateFromSpirV(ShaderByteCode);
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
