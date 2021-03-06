﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class InputActionsBinder : MonoBehaviour {

	public Vector2 LeftStickPosition => _input.Gamepad.Move.ReadValue<Vector2>();
	public Vector2 RightStickPosition => _input.Gamepad.Rotate.ReadValue<Vector2>();
    public event Action OnHandGrabPerformed = () => { };
    public event Action OnHandReleasePerformed = () => { };

    public bool enableDebugs = false;
    
    private InputMapping _input;

    private void Awake() {
        _input = new InputMapping();
        _input.Gamepad.HandGrab.performed += HandleHandGrab;
        _input.Gamepad.HandRelease.performed += HandleHandRelease;
    }
    
    private void HandleHandGrab(InputAction.CallbackContext context) {
        if (enableDebugs)
            Debug.Log($"<color=cyan>hand grab performed</color>");
        OnHandGrabPerformed();
    }
    
    private void HandleHandRelease(InputAction.CallbackContext context) {
        if (enableDebugs)
            Debug.Log($"<color=magenta>hand release performed</color>");
        OnHandReleasePerformed();
    }

    private void OnEnable() => _input.Enable();
    private void OnDisable() => _input.Disable();
}
