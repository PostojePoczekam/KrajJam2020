using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class HookAnimation : MonoBehaviour
{
    private Gamepad _gamepad;
    [SerializeField] private int _playerIndex = 0;
    [SerializeField] private Transform _topFinger;
    [SerializeField] private Transform _bottomFinger;

    private float _target;
    private void Update() {
        _target = Mathf.Lerp(_target, _gamepad.rightTrigger.ReadValue(), Time.deltaTime * 10f);
        if (Gamepad.all.ToArray().Length <= _playerIndex) return;

        _topFinger.localRotation = Quaternion.Lerp(Quaternion.Euler(0f, -30f, 0f), Quaternion.identity, _target);
        _bottomFinger.localRotation = Quaternion.Lerp(Quaternion.Euler(0f, 30f, 0f), Quaternion.identity, _target);
        
    }

    private void Awake()
    {
        if (Gamepad.all.ToArray().Length <= _playerIndex) return;
        _gamepad = Gamepad.all.ToArray()[_playerIndex];
    }
}
