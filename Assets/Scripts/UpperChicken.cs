using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpperChicken : Fixable {

	// private FixedJoint _fixedJoint;
	
	private void OnCollisionEnter(Collision other) {
		Debug.Log($"<color=white>we got bottom chicken</color>");
		var bottom = other.collider.GetComponent<BottomChicken>();
		if (bottom == null) return;

		// if (Vector3.Dot(transform.rotation.eulerAngles.normalized, bottom.transform.rotation.eulerAngles.normalized) > 0.8f) {
		// 	Debug.Log($"<color=cyan> > 0.8f </color>");
		// }

		// _fixedJoint.connectedBody = bottom._rigidbody;
		bottom.SetFixed(transform);
		isFixed = true;
	}

	// protected override void Init() {
	// 	_fixedJoint = GetComponent<FixedJoint>();
	// }
}