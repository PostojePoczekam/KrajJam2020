﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArmController : MonoBehaviour
{

	[SerializeField] private InputActionsBinder _input;
	[SerializeField] private Transform _hand;
	[SerializeField] private float _movementSpeed = 0.1f;

	private void MoveArm(Vector2 delta) => _hand.Translate(-delta.x * _movementSpeed, 0f, -delta.y * _movementSpeed);

	private void Update()
	{
		MoveArm(_input.LeftStickPosition);
	}
}
