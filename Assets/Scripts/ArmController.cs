using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArmController : MonoBehaviour
{

	[SerializeField] private InputActionsBinder _input;
	[SerializeField] private InteractionHand _interactionHand;
	[SerializeField] private Transform _hand;
	[SerializeField] private float _movementSpeed = 0.1f;

	private void MoveArm(Vector2 delta) => _hand.Translate(-delta.x * _movementSpeed, 0f, -delta.y * _movementSpeed);

	private void RotateArm(Vector2 direction)
	{
		//if
	}

	private void Grab() {
		_interactionHand.Grab();
	}
	
	private void ReleaseGrab() {
		_interactionHand.Release();
	}

	private void Update()
	{
		MoveArm(_input.LeftStickPosition);
		RotateArm(_input.RightStickPosition);
	}

	private void Start() {
		_input.OnHandGrabPerformed += Grab;
		_input.OnHandReleasePerformed += ReleaseGrab;
	}
}
