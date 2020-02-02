using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.ProBuilder.MeshOperations;

public class Valve : Fixable {
	private bool _isHeld = false;
	private float _angleSum = 0f;
	private Vector3 _previousForward;

	public override void GrabThis(InteractionHand hand) {
		base.GrabThis(hand);
		_isHeld = true;
		_previousForward = transform.GetChild(0).forward;
	}

	protected override void ReleaseThis(InteractionHand hand) {
		base.ReleaseThis(hand);
		_isHeld = true;
	}

	private void Update() {
		if (isFixed)
			return;

		_angleSum += Mathf.Abs(Vector3.Angle(_previousForward, transform.GetChild(0).forward));
		_previousForward = transform.GetChild(0).forward;

		if (_angleSum > 1800f) {
			isFixed = true;
			transform.GetChild(0).gameObject.AddComponent<Fixable>().isFixed = true;
			transform.GetChild(0).SetParent(transform.parent);
			Destroy(GetComponent<ConfigurableJoint>());
			Destroy(GetComponent<BoxCollider>());
		}


	}
}