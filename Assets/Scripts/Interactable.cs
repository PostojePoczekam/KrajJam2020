using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour {

	[SerializeField] private Rigidbody _rigidbody => GetComponent<Rigidbody>();
	[SerializeField] private FixedJoint hingeJoint => GetComponent<FixedJoint>();

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
		hingeJoint.connectedBody = other;
		
		// Debug.Log($"<color=green>after</color>");
		// Debug.Log($"<color=white>interactable pos: {transform.position}</color>");
		// Debug.Log($"<color=gray>arm pos: {other.transform.position}</color>");
	}
	
	public void ReleaseJoint() {
		hingeJoint.connectedBody = null;
	}

}