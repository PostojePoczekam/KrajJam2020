using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpperChicken : Fixable {

	// private FixedJoint _fixedJoint;
	public bool enableDebugs = false;
	
	private void OnCollisionEnter(Collision other) {
		var bottom = other.collider.GetComponent<BottomChicken>();
		if (bottom == null || bottom.isFixed || this.isFixed ) return;

		if (Vector3.Dot(transform.forward.normalized, bottom.transform.forward.normalized) < 0.8f) {
			Debug.Log($"<color=red> failed to match chickens due to rotation. dot  = {Vector3.Dot(transform.rotation.eulerAngles.normalized, bottom.transform.rotation.eulerAngles.normalized)}</color>");
			return;
		}

		// _fixedJoint.connectedBody = bottom._rigidbody;
		bottom.SetFixed(transform);
		isFixed = true;
		ReleaseThis();
	}

	// protected override void Init() {
	// 	_fixedJoint = GetComponent<FixedJoint>();
	// }
}