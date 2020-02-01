using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour {

	public Rigidbody rigidbody => GetComponent<Rigidbody>();

	public void MoveTowards(Vector3 dir) {
		rigidbody.velocity = dir;
	}

}
