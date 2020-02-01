using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class InteractionHand : MonoBehaviour {

	[SerializeField] private Rigidbody _rigidbody;
	[SerializeField] private FixedJoint _fixedJoint;
	[SerializeField] private readonly HashSet<Interactable> _targets = new HashSet<Interactable>();
	[SerializeField] private Interactable _grabbedObj;
	[SerializeField] private bool _enableDebugs = false;

	public void Grab() {
		var closest = GetClosestTarget();
		if (closest == null) {
			if (_enableDebugs) Debug.Log($"<color=red> no target to be grabbed</color>");
		} else {
			if (_enableDebugs) Debug.Log($"<color=green> grabbing </color>", closest.gameObject);

			_fixedJoint.connectedBody = closest._rigidbody;
			// closest.SetJoint(_rigidbody);
			_grabbedObj = closest;
		}
	}

	public void Release() {
		// if (_grabbedObj is null) return;

		_fixedJoint.connectedBody = null;

		// _grabbedObj.ReleaseJoint();
		// _grabbedObj = null;
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
