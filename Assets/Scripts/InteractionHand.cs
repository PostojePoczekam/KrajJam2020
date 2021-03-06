﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class InteractionHand : MonoBehaviour {

	public static event Action OnGrab = () => { };

	[SerializeField] private Rigidbody _rigidbody;
	[SerializeField] private FixedJoint _fixedJoint;
	// [SerializeField] private List<Interactable> _targets = new List<Interactable>();
	[SerializeField] private Interactable _grabbedObj;
	[SerializeField] private bool _enableDebugs = false;

	public void Grab() {
		Collider[] allOverlappingColliders = Physics.OverlapSphere(transform.position - (transform.forward + Vector3.up) * 0.5f, 0.8f);

		_grabbedObj =  
			allOverlappingColliders
				.Select(x => x.GetComponent<Interactable>())
				.Where(x => x != null)
				.OrderByDescending(x => GetDistance(x.transform.position))
				.FirstOrDefault();

		if (_grabbedObj == null) return;
		
		float GetDistance(Vector3 pos) => (pos - transform.position).magnitude;

		OnGrab();
		_grabbedObj.transform.position = transform.position;
		_fixedJoint.connectedBody = _grabbedObj._rigidbody;
		_grabbedObj.GrabThis(this);
		_grabbedObj.OnForceRelease += Release;
	}

	public void Release() {
		_fixedJoint.connectedBody = null;
		if (_grabbedObj == null) return;
		_grabbedObj.OnForceRelease -= Release;
		StartCoroutine(Wake());

		_grabbedObj = null;
		// if(_targets.Contains(_grabbedObj))
		// 	_targets.Remove(_grabbedObj);
	}

	private IEnumerator Wake() {
		yield return new WaitForFixedUpdate();
		_grabbedObj?._rigidbody?.WakeUp();
	}

	private void Update() {
		if (!_grabbedObj)
			return;

		_grabbedObj.transform.position = transform.position - (transform.forward + Vector3.up) * 0.25f;
	}

	private void OnDestroy() {
		StopAllCoroutines();
	}

	// private void RemoveObject(Interactable obj) {
	// 	if(_targets.Contains(obj))
	// 		_targets.Remove(obj);
	// }

	// private Interactable _latestEnteredCache;

	// private void OnTriggerEnter(Collider other) {
	// 	var interactable = other.GetComponent<Interactable>();
	// 	if (interactable == null) return;
	// 	_targets.Add(interactable);
	// 	_latestEnteredCache = interactable;
	// 	interactable.OnForceRelease += RemoveObject;
	// }
	
	// private void OnTriggerExit(Collider other) {
	// 	var interactable = other.GetComponent<Interactable>();
	// 	if (interactable == null) return;
	// 	_targets.Remove(interactable);
	// }

	private void Start() {
		_rigidbody = GetComponent<Rigidbody>();
	}

	// private Interactable GetClosestTarget() {
	// 	if (_targets.Count == 0)
	// 		return null;
	// 	
	// 	var ordered = _targets.OrderByDescending(x => GetDistance(x));
	// 	return ordered.First();
	//
	// 	float GetDistance(Interactable obj) {
	// 		return (obj.transform.position - transform.position).magnitude;
	// 	}
	// }
}
