using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using static UnityEngine.InputSystem.InputAction;

public class ArmController : MonoBehaviour
{

	[SerializeField] private InteractionHand _interactionHand;
	[SerializeField] private Rigidbody _hand;
	[SerializeField] private float _movementSpeed = 0.1f;
	[SerializeField] private int _playerIndex;
	private Gamepad _gamepad;


	private Vector2 _movementVector;

	private void MoveArm(Vector2 delta) => _hand.MovePosition(_hand.position + new Vector3(-delta.x, 0f, -delta.y) * _movementSpeed);
	private void RotateArm(Vector2 forward)
	{
		if (forward.magnitude > 0.1f)
			_hand.rotation = Quaternion.LookRotation(new Vector3(forward.x, 0f, forward.y));
	}

	private void Grab()
	{
		_interactionHand.Grab();
	}

	private void Update()
	{
		MoveArm(_gamepad.leftStick.ReadValue());
		RotateArm(_gamepad.rightStick.ReadValue());
	}

	private void Awake()
	{
		_gamepad = Gamepad.all.ToArray()[_playerIndex];
	}
}
