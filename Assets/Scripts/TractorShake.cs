using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TractorShake : MonoBehaviour
{
	public float shakeMagnitude = 0.7f;
	private Vector3 initialPosition;

	void Awake()
	{
		initialPosition = transform.localPosition;
	}

	void Update()
	{
		transform.localPosition = initialPosition + Random.insideUnitSphere * shakeMagnitude;
	}
}
