using UnityEngine;


public class BottomChicken : Fixable {

	// public Rigidbody rigidbody { get; private set; }

	public void SetFixed(Transform newParent) {
		Debug.Log($"<color=green>fixed</color>");
		// isPickable = false;
		// isFixed = true;
		transform.parent = newParent;
		transform.position = newParent.position;
		ReleaseThis();
		Destroy(_rigidbody);
		Destroy(this);
	}

	// protected override void Init() {
	// 	rigidbody = GetComponent<Rigidbody>();
	// }

}