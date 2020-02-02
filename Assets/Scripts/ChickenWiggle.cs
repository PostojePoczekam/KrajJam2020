using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChickenWiggle : MonoBehaviour
{
	public Transform leftArm;
	public Transform rightArm;
	public Transform head;

	private void Update() {
		head.localPosition = new Vector3(Mathf.Sin(Time.time *8f)/15f,head.localPosition.y , head.localPosition.z);
		//WiggleArms(Quaternion.Lerp(Quaternion.Euler(0, 0, -45), Quaternion.Euler(0, 0, 45), Mathf.PingPong(Time.time, 1f)));
	}

    private void WiggleArms(Quaternion wiggle)
	{
		leftArm.localPosition = wiggle* Vector3.left;
		rightArm.localPosition = wiggle* Vector3.right;
	}
}
