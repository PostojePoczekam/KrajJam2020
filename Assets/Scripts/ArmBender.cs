using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ArmBender : MonoBehaviour
{
	public Vector3 From { get { return _from; } set { _from = value; } }
	public Vector3 To { get { return _to; } set { _to = value; } }

	[SerializeField] private Vector3 _from;
	[SerializeField] private Vector3 _to;
	[SerializeField] private Vector3 _midpoint;
	[SerializeField] private Vector3 _midpointVelocity;

	private void Awake()
	{
		_midpoint = Vector3.Lerp(_from, _to, 0.5f);
	}

	private void Update()
	{
		int segmentsCount = transform.childCount;
		_midpoint = Vector3.SmoothDamp(_midpoint, Vector3.Lerp(_from, _to, 0.5f), ref _midpointVelocity, 0.1f);
		var points = BezierCurve.GetPoints(_from, _to, _midpoint, segmentsCount).ToList();
		for (int i = 0; i < segmentsCount; i++)
			transform.GetChild(i).position = points[i];
	}

	private void OnDrawGizmosSelected()
	{
		Gizmos.color = Color.red;
		Gizmos.DrawWireSphere(_from, 1f);
		Gizmos.color = Color.green;
		Gizmos.DrawWireSphere(_midpoint, 1f);
		Gizmos.color = Color.blue;
		Gizmos.DrawWireSphere(_to, 1f);
	}
}
