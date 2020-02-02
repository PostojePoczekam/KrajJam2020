using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class UpperChicken : Fixable {

	public bool enableDebugs = false;
	public ParticleSystem particless;
	public float particlesTimeout = 1f;

	private void OnCollisionStay(Collision other) {
		var bottom = other.collider.GetComponent<BottomChicken>();
		if (bottom == null || bottom.isFixed || this.isFixed ) return;
		if (!IsInBlowtorchRange()) return;

		if (Vector3.Dot(transform.forward.normalized, bottom.transform.forward.normalized) < 0.8f) {
			Debug.Log($"<color=red> failed to match chickens due to rotation. dot  = {Vector3.Dot(transform.rotation.eulerAngles.normalized, bottom.transform.rotation.eulerAngles.normalized)}</color>");
			return;
		}

		bottom.SetFixed(transform);
		isFixed = true;
		particless.gameObject.SetActive(true);
		particless.Play();
		ReleaseThis();
		CancelInvoke(nameof(ResetParticles));
		Invoke(nameof(ResetParticles), particlesTimeout);
	}

	private void ResetParticles() {
		particless.gameObject.SetActive(false);
	}
}