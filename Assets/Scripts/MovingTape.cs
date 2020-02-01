using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingTape : MonoBehaviour {

	[SerializeField] private float _respawnDistance = 10f;

	[SerializeField] private float _speed = 1f;

	private Vector3 _startingPos;
	private Rigidbody rigid => GetComponent<Rigidbody>();

	private float distanceProgress = 0f;
	// public MovingTape tape1;

	private void Start() {
		_startingPos = transform.position;
		// tape2.transform.position = startingPos + transform.forward * (respawnDistance / 2);
		// distanceProgress2 = respawnDistance / 2;
	}

	private void Update() {
		distanceProgress += Time.deltaTime * _speed;
		rigid.MovePosition(_startingPos + distanceProgress * transform.forward);


		// tape1.transform.position = startingPos + distanceProgress1 * transform.forward;

		if (distanceProgress >= _respawnDistance)
			ResetPos();
	}

	private void ResetPos() {
		transform.position = _startingPos;
		distanceProgress = 0f;
	}
}