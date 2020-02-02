using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoundingRect : MonoBehaviour
{
	[SerializeField] private Rect _bounds;

	public bool CanMove(Vector3 target) => _bounds.Contains(new Vector2(target.x, target.z));

	private void OnDrawGizmosSelected()
	{
		Gizmos.color = Color.red;
		Gizmos.DrawCube(new Vector3(_bounds.center.x, 0f, _bounds.center.y), new Vector3(_bounds.size.x, 1f, _bounds.size.y));
	}
}
