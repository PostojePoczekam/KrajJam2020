using UnityEngine;


public class BottomChicken : Fixable {

	public void SetFixed(Transform newParent) {
		Debug.Log($"<color=green>fixed</color>", gameObject);
		// isPickable = false;
		// isFixed = true;
		transform.parent = newParent;
		transform.position = newParent.position;
		transform.localRotation = Quaternion.identity;
		ReleaseThis();
		Destroy(_rigidbody);
		Destroy(this);
	}
}