// using System;
// using System.Collections;
// using System.Collections.Generic;
// using UnityEngine;
//
// public class MovingTape : MonoBehaviour {
//
// 	public bool enableDebugs = false;
//
// 	public float speed = 1f;
//
// 	[SerializeField] private List<Interactable> objetcsOnTape = new List<Interactable>();
//
// 	private void Update() {
// 		foreach (var interactable in objetcsOnTape) {
// 			interactable.MoveTowards(-transform.forward * (speed * Time.deltaTime));
// 		}
// 	}
//
// 	private void OnCollisionEnter(Collision other) {
// 		var newInteractable = other.collider.GetComponent<Interactable>();
//
// 		if (newInteractable == null) return;
// 		
// 		if (enableDebugs)
// 			Debug.Log($"<color=green>new interactable entered</color>", newInteractable.gameObject);
//
// 		objetcsOnTape.Add(newInteractable);
// 	}
//
// 	private void OnCollisionStay(Collision other) {
// 		var newInteractable = other.collider.GetComponent<Interactable>();
//
// 		if (newInteractable == null) return;
// 		
// 		// if (enableDebugs)
// 		// 	Debug.Log($"<color=green>new interactable entered</color>", newInteractable.gameObject);
//
// 		newInteractable.MoveTowards(-transform.forward * (speed * Time.deltaTime));
// 	}
//
// 	private void OnCollisionExit(Collision other) {
// 		var lastInteractable = other.collider.GetComponent<Interactable>();
//
// 		if (lastInteractable == null) return;
// 		
// 		if (enableDebugs)
// 			Debug.Log($"<color=red> interactable exited </color>", lastInteractable.gameObject);
//
// 		objetcsOnTape.Remove(lastInteractable);
// 	}
//
// }
