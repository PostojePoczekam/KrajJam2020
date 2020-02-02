using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour {

	public event Action OnForceRelease;

	public float _releaseForceMultiplier = 1f;

	public Rigidbody _rigidbody { get; private set; }
	// public bool isPickable { get; protected set; } = true;

	public void MoveTowards(Vector3 dir) {
		if (_rigidbody == null) return;
		_rigidbody.velocity = dir;
	}

	public void GrabThis() {
		// _rigidbody.MovePosition
		_rigidbody.constraints = RigidbodyConstraints.None;
	}

	// public void SetJoint(Rigidbody other) {
	// 	// _rigidbody.MovePosition(other.transform.position); TODO: to gowno nie dziala, ponizej przypisanie pozycji na chama lepiej dziala
	// 	transform.position = other.transform.position;
	// }
	
	protected void ReleaseThis() {
		OnForceRelease?.Invoke();
		_rigidbody.AddForce(Vector3.up * _releaseForceMultiplier, ForceMode.VelocityChange);
	}

	private void Start() {
		_rigidbody = GetComponent<Rigidbody>();
		Init();
	}

	protected virtual void Init() { }
}