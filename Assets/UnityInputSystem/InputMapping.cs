// GENERATED AUTOMATICALLY FROM 'Assets/InputMapping.inputactions'

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

public class @InputMapping : IInputActionCollection, IDisposable
{
    public InputActionAsset asset { get; }
    public @InputMapping()
    {
        asset = InputActionAsset.FromJson(@"{
    ""name"": ""InputMapping"",
    ""maps"": [
        {
            ""name"": ""Gamepad"",
            ""id"": ""01e1b082-c3a8-48f5-9270-ad9ff2957eaf"",
            ""actions"": [
                {
                    ""name"": ""Move"",
                    ""type"": ""Value"",
                    ""id"": ""1f287b3f-f256-42f3-bb11-fec43809a26f"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """"
                },
                {
                    ""name"": ""HandGrab"",
                    ""type"": ""Button"",
                    ""id"": ""fb1361d1-fafc-49c2-a81d-cd7303d1787b"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """"
                }
            ],
            ""bindings"": [
                {
                    ""name"": """",
                    ""id"": ""4ea79216-5324-4151-95a5-bbc002167e1a"",
                    ""path"": ""<Gamepad>/leftStick"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""477ed640-bfae-4af8-8fed-ee827df8ed3d"",
                    ""path"": ""<XInputController>/buttonSouth"",
                    ""interactions"": ""Press"",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""HandGrab"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""ade87ea6-e2c3-4676-9234-5b4a85d4d617"",
                    ""path"": ""<DualShockGamepad>/buttonSouth"",
                    ""interactions"": ""Press"",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""HandGrab"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        }
    ],
    ""controlSchemes"": []
}");
        // Gamepad
        m_Gamepad = asset.FindActionMap("Gamepad", throwIfNotFound: true);
        m_Gamepad_Move = m_Gamepad.FindAction("Move", throwIfNotFound: true);
        m_Gamepad_HandGrab = m_Gamepad.FindAction("HandGrab", throwIfNotFound: true);
    }

    public void Dispose()
    {
        UnityEngine.Object.Destroy(asset);
    }

    public InputBinding? bindingMask
    {
        get => asset.bindingMask;
        set => asset.bindingMask = value;
    }

    public ReadOnlyArray<InputDevice>? devices
    {
        get => asset.devices;
        set => asset.devices = value;
    }

    public ReadOnlyArray<InputControlScheme> controlSchemes => asset.controlSchemes;

    public bool Contains(InputAction action)
    {
        return asset.Contains(action);
    }

    public IEnumerator<InputAction> GetEnumerator()
    {
        return asset.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }

    public void Enable()
    {
        asset.Enable();
    }

    public void Disable()
    {
        asset.Disable();
    }

    // Gamepad
    private readonly InputActionMap m_Gamepad;
    private IGamepadActions m_GamepadActionsCallbackInterface;
    private readonly InputAction m_Gamepad_Move;
    private readonly InputAction m_Gamepad_HandGrab;
    public struct GamepadActions
    {
        private @InputMapping m_Wrapper;
        public GamepadActions(@InputMapping wrapper) { m_Wrapper = wrapper; }
        public InputAction @Move => m_Wrapper.m_Gamepad_Move;
        public InputAction @HandGrab => m_Wrapper.m_Gamepad_HandGrab;
        public InputActionMap Get() { return m_Wrapper.m_Gamepad; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(GamepadActions set) { return set.Get(); }
        public void SetCallbacks(IGamepadActions instance)
        {
            if (m_Wrapper.m_GamepadActionsCallbackInterface != null)
            {
                @Move.started -= m_Wrapper.m_GamepadActionsCallbackInterface.OnMove;
                @Move.performed -= m_Wrapper.m_GamepadActionsCallbackInterface.OnMove;
                @Move.canceled -= m_Wrapper.m_GamepadActionsCallbackInterface.OnMove;
                @HandGrab.started -= m_Wrapper.m_GamepadActionsCallbackInterface.OnHandGrab;
                @HandGrab.performed -= m_Wrapper.m_GamepadActionsCallbackInterface.OnHandGrab;
                @HandGrab.canceled -= m_Wrapper.m_GamepadActionsCallbackInterface.OnHandGrab;
            }
            m_Wrapper.m_GamepadActionsCallbackInterface = instance;
            if (instance != null)
            {
                @Move.started += instance.OnMove;
                @Move.performed += instance.OnMove;
                @Move.canceled += instance.OnMove;
                @HandGrab.started += instance.OnHandGrab;
                @HandGrab.performed += instance.OnHandGrab;
                @HandGrab.canceled += instance.OnHandGrab;
            }
        }
    }
    public GamepadActions @Gamepad => new GamepadActions(this);
    public interface IGamepadActions
    {
        void OnMove(InputAction.CallbackContext context);
        void OnHandGrab(InputAction.CallbackContext context);
    }
}
