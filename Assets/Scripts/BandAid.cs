using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BandAid : Interactable
{
	public void SetFixed(Transform newParent) {
		transform.parent = newParent;
		transform.position = newParent.position;
		transform.localRotation = Quaternion.identity;
		ReleaseThis(null);
		Destroy(_rigidbody);
		Destroy(this);
	}
}
