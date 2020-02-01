using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour {

	public Rigidbody _rigidbody { get; private set; }
	// private FixedJoint _fixedJoint;

	public void MoveTowards(Vector3 dir) {
		_rigidbody.velocity = dir;
	}

	public void SetJoint(Rigidbody other) {
		// Debug.Log($"<color=green>before</color>");
		// Debug.Log($"<color=white>interactable pos: {transform.position}</color>");
		// Debug.Log($"<color=gray>arm pos: {other.transform.position}</color>");
		// _rigidbody.MovePosition(other.transform.position); TODO: to gowno nie dziala, ponizej przypisanie pozycji na chama lepiej dziala
		
		// Debug.Log($"<color=magenta>middle</color>");
		// Debug.Log($"<color=white>interactable pos: {transform.position}</color>");
		// Debug.Log($"<color=gray>arm pos: {other.transform.position}</color>");
		
		transform.position = other.transform.position; 
		// _fixedJoint.connectedBody = other;
		
		// Debug.Log($"<color=green>after</color>");
		// Debug.Log($"<color=white>interactable pos: {transform.position}</color>");
		// Debug.Log($"<color=gray>arm pos: {other.transform.position}</color>");
	}
	
	public void ReleaseJoint() {
		// _fixedJoint.connectedBody = null;
	}

	private void Start() {
		_rigidbody = GetComponent<Rigidbody>(); 
		// _fixedJoint = GetComponent<FixedJoint>();
	}
}