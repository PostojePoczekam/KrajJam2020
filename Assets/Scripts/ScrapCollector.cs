using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Linq;

public class ScrapCollector : MonoBehaviour
{
	private int _promoted = 0;
	private List<Type> _types = new Type[] { typeof(Valve), typeof(UpperChicken), typeof(Arm) }.ToList();
	public event Action<int> OnScrapCollected;
	public event Action<int> OnPromote;


	private void OnTriggerEnter(Collider collider)
	{
		var fixable = collider.gameObject.GetComponent<Fixable>();
		if (fixable != null && fixable.isFixed)
		{
			var isPromoted = _types.IndexOf(fixable.GetType()) == _promoted;
			if (isPromoted)
			{
				OnScrapCollected?.Invoke(20);
				_promoted = UnityEngine.Random.Range(0, _types.Count);
				OnPromote?.Invoke(_promoted);
			}
			else
			{
				OnScrapCollected?.Invoke(10);
			}

		}

		Destroy(collider.transform.gameObject);
	}
}
