using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChickenWiggle : MonoBehaviour
{
	public Transform leftArm;
	public Transform rightArm;

	private void Update()
	{
		WiggleArms(Quaternion.Lerp(Quaternion.Euler(0, 0, -45), Quaternion.Euler(0, 0, 45), Mathf.PingPong(Time.time, 1f)));
	}

    private void WiggleArms(Quaternion wiggle)
	{
		leftArm.localPosition = wiggle* Vector3.left;
		rightArm.localPosition = wiggle* Vector3.right;
	}
}
