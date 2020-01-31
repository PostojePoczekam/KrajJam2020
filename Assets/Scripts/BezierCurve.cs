using System;
using System.Collections.Generic;
using UnityEngine;

public static class BezierCurve
{
	public static IEnumerable<Vector3> GetPoints(Vector3 from, Vector3 to, Vector3 midpoint, int segmentsCount)
	{
		if (segmentsCount < 2)
			throw new ArgumentException();

		for (int i = 0; i < segmentsCount; i++)
		{
			float delta = i * 1 / (float)segmentsCount;
			yield return Vector3.Lerp(Vector3.Lerp(from, midpoint, delta), Vector3.Lerp(midpoint, to, delta), delta);
		}
	}
}
