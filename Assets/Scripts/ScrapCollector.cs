using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
public class ScrapCollector : MonoBehaviour
{
	public event Action OnPointsEarned;

	private void OnTriggerEnter(Collider collider)
	{
		var fixable = collider.gameObject.GetComponent<Fixable>();
		if (fixable != null && fixable.isFixed)
			OnPointsEarned?.Invoke();

		Destroy(collider.transform.gameObject);
	}
}
