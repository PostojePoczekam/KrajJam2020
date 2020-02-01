using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableSpawner : MonoBehaviour {

	[SerializeField] private float _timeoutBetweenSpawns = 1f;

	[SerializeField] private GameObject _temaplate;

	private void Awake() {
		InvokeRepeating(nameof(SpawnObject), 1f, _timeoutBetweenSpawns);
	}

	private void SpawnObject() {
		var newObj = Instantiate(_temaplate);
		newObj.SetActive(true);
		newObj.transform.position = transform.position;
	}
}
