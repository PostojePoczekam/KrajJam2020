using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arm : Fixable {
	public static event Action OnFixed = () => { };

	public GameObject particlesBlood;
	
	private void OnCollisionEnter(Collision collision) {
		var bandaid = collision.collider.GetComponent<BandAid>();
		if (bandaid == null || this.isFixed) return;
		isFixed = true;
		bandaid.SetFixed(transform);
		OnFixed();
		particlesBlood.SetActive(false);
		ReleaseThis(null);
	}
}