using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableSpawner : MonoBehaviour
{

	[SerializeField] private float _timeoutBetweenSpawns = 1f;

	[SerializeField] private List<GameObject> _temaplates;

	private void Awake()
	{
		InvokeRepeating(nameof(SpawnObject), 1f, _timeoutBetweenSpawns);
	}

	private void SpawnObject()
	{
		int nextIndex = Random.Range(0, _temaplates.Count);
		var newObj = Instantiate(_temaplates[nextIndex]);
		newObj.SetActive(true);
		newObj.transform.position = transform.position;
	}
}
