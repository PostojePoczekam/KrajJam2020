using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChickenWiggle : MonoBehaviour
{
	public Transform leftArm;
	public Transform rightArm;
	public Transform head;

	private void Update()
	{
		head.localPosition = new Vector3(Mathf.Sin(Time.time * 8f) / 15f, head.localPosition.y, head.localPosition.z);
		leftArm.transform.position = _cacheLeft + Vector3.up * Mathf.PerlinNoise(Time.time, 0.0f) / 4f - Vector3.up * 0.1f;
		rightArm.transform.position = _cacheRight + Vector3.up * Mathf.PerlinNoise(0.0f, Time.time) / 4f - Vector3.up * 0.1f;
	}

	private Vector3 _cacheLeft, _cacheRight;

	private void Awake()
	{
		_cacheLeft = leftArm.transform.position;
		_cacheRight = rightArm.transform.position;
	}

}
