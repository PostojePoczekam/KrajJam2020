using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class InputActionsBinder : MonoBehaviour {

    public event Action<Vector2> OnMovementInputGathered = (direction) => { };
    public event Action OnHandGrabPerformed = () => { };

    public bool enableDebugs = false;
    
    private InputMapping _input;

    private void Awake() {
        _input = new InputMapping();
        _input.Gamepad.Move.performed += HandleMovement;
        _input.Gamepad.HandGrab.performed += HandleHandGrab;
    }

    private void HandleMovement(InputAction.CallbackContext context) {
        Vector2 inputVal = context.ReadValue<Vector2>();
        if (enableDebugs)
            Debug.Log($"<color=white>left joystick val: {inputVal}</color>");
        OnMovementInputGathered(inputVal);
    }
    
    private void HandleHandGrab(InputAction.CallbackContext context) {
        if (enableDebugs)
            Debug.Log($"<color=cyan>hand grab performed</color>");
        OnHandGrabPerformed();
    }

    private void OnEnable() => _input.Enable();
    private void OnDisable() => _input.Disable();
}
