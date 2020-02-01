using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class InteractionHand : MonoBehaviour {

	[SerializeField] private Rigidbody _rigidbody;
	[SerializeField] private readonly HashSet<Interactable> _targets = new HashSet<Interactable>();
	[SerializeField] private bool enableDebugs = false;

	public void Grab() {
		var closest = GetClosestTarget();
		if (closest == null) {
			if (enableDebugs) Debug.Log($"<color=red> no target to be grabbed</color>");
		} else {
			if (enableDebugs) Debug.Log($"<color=green> grabbing </color>", closest.gameObject);
			closest.SetConnectedBody(_rigidbody);
		}
	}

	private void OnTriggerEnter(Collider other) {
		var interactable = other.GetComponent<Interactable>();

		if (interactable == null) return;

		_targets.Add(interactable);
	}
	
	private void OnTriggerExit(Collider other) {
		var interactable = other.GetComponent<Interactable>();

		if (interactable == null) return;

		_targets.Remove(interactable);
	}

	private void Start() {
		_rigidbody = GetComponent<Rigidbody>();
	}

	private Interactable GetClosestTarget() {
		if (_targets.Count == 0)
			return null;
		
		var ordered = _targets.OrderByDescending(x => GetDistance(x));
		return ordered.First();

		float GetDistance(Interactable obj) {
			return (obj.transform.position - transform.position).magnitude;
		}
	}
}
