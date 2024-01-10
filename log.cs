using Godot;
using System;

public partial class log : Node3D
{
	// Called when the node enters the scene tree for the first time.

	[Export] private Timer OneMinuteAverage;

	private bool IsTime = true;
	public override void _Ready()
	{
		OneMinuteAverage.Start();
	}

	private void Log()
	{
		GD.Print(Engine.GetFramesPerSecond());
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if (IsTime)
		{
			Log();
		}
	}

	public void StopLogging()
	{
		IsTime = false;
		GD.Print("Frame Rates Gathered");
	}
}
