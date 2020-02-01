using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ArmBender : MonoBehaviour
{
	[SerializeField] private Transform _from;
	[SerializeField] private Transform _to;
	[SerializeField] private Transform _midpoint;
	[SerializeField] private Side _side;
	[SerializeField] private float _elbowOffset;

	private void Update()
	{
		int segmentsCount = transform.childCount;
		var points = BezierCurve.GetPoints(_from.position, _to.position, _midpoint.position + Vector3.right * _elbowOffset * (float)_side, segmentsCount).ToList();
		for (int i = 0; i < segmentsCount; i++)
		{
			transform.GetChild(i).position = points[i];
			if (i < segmentsCount - 1)
				transform.GetChild(i).forward = transform.GetChild(i).position - transform.GetChild(i + 1).position;
		}

	}

	private void OnDrawGizmosSelected()
	{
		Gizmos.color = Color.red;
		Gizmos.DrawWireSphere(_from.position, 1f);
		Gizmos.color = Color.green;
		Gizmos.DrawWireSphere(_midpoint.position, 1f);
		Gizmos.color = Color.blue;
		Gizmos.DrawWireSphere(_to.position, 1f);
	}
}
