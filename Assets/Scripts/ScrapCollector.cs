using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
public class ScrapCollector : MonoBehaviour
{
	public event Action OnScrapCollected;

	private void OnTriggerEnter(Collider collider)
	{
		var fixable = collider.gameObject.GetComponent<Fixable>();
		if (fixable != null && fixable.isFixed)
			OnScrapCollected?.Invoke();

		Destroy(collider.transform.gameObject);
	}
}
