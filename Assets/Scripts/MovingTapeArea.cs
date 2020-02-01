using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// rusza w kierunku niebieskiej osi
[RequireComponent(typeof(BoxCollider))]
public class MovingTapeArea : MonoBehaviour {

	public bool enableDebugs = false;

	public float speed = 1f;

	[SerializeField] private List<Interactable> objetcsOnTape = new List<Interactable>();

	private void Update() {
		foreach (var interactable in objetcsOnTape) 
			interactable.MoveTowards(transform.forward * (speed * Time.deltaTime));	
	}

	private void OnTriggerEnter(Collider other) {
		var newInteractable = other.GetComponent<Interactable>();
		if (newInteractable == null) return;		
		if (enableDebugs) Debug.Log($"<color=green>new interactable entered</color>", newInteractable.gameObject);
		objetcsOnTape.Add(newInteractable);
	}

	private void FixedUpdate() {
		foreach (var objOnTape in objetcsOnTape) 
			objOnTape.MoveTowards(transform.forward * (speed * Time.deltaTime));
	}

	// private void OnTriggerStay(Collider other) {
	// 	var newInteractable = other.GetComponent<Interactable>();
	// 	if (newInteractable == null) return;
	// 	newInteractable.MoveTowards(-transform.forward * (speed * Time.deltaTime));
	// }

	private void OnTriggerExit(Collider other) {
		var lastInteractable = other.GetComponent<Interactable>();
		if (lastInteractable == null) return;
		if (enableDebugs) Debug.Log($"<color=red> interactable exited </color>", lastInteractable.gameObject);
		objetcsOnTape.Remove(lastInteractable);
	}
}
