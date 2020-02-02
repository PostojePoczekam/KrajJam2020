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
		int segmentsCount = transform.childCount -1;
		float offset = Vector3.Cross(_from.forward, _to.forward).y * (float)_side / 5f;
		var points = BezierCurve.GetPoints(_from.position, _to.position, _midpoint.position + Vector3.right * (offset + _elbowOffset * (float)_side), segmentsCount).ToList();
		for (int i = 0; i < segmentsCount; i++)
		{
			transform.GetChild(i).position = points[i];
			if (i < segmentsCount - 1)
				transform.GetChild(i).forward = transform.GetChild(i).position - transform.GetChild(i + 1).position;
		}

		transform.GetChild(segmentsCount - 1).forward = transform.GetChild(segmentsCount - 2).forward;
		//transform.GetChild(segmentsCount).position = transform.GetChild(segmentsCount - 1).position;
		transform.GetChild(segmentsCount).forward = _to.forward + Vector3.up;
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
