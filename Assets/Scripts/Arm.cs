using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arm : Fixable {
	private void OnCollisionEnter(Collision collision) {
		var bandaid = collision.collider.GetComponent<BandAid>();
		if (bandaid == null || this.isFixed) return;
		isFixed = true;
		ReleaseThis(null);
	}
}