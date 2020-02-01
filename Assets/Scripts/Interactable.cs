using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour {

	[SerializeField] private Rigidbody rigidbody => GetComponent<Rigidbody>();
	[SerializeField] private FixedJoint hingeJoint => GetComponent<FixedJoint>();

	public void MoveTowards(Vector3 dir) {
		rigidbody.velocity = dir;
	}

	public void SetConnectedBody(Rigidbody other) {
		hingeJoint.connectedBody = other;
	}

}
