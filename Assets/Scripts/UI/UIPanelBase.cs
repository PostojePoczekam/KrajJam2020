using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIPanelBase : MonoBehaviour {

	public static event Action OnAnyActivated;
	public static event Action OnAnyDeactivated;
	
	public event Action OnActivated;
	public event Action OnDeactivated;
	
	public bool activated { get; private set; }

	public void Deactivate() {
		activated = false;
		gameObject.SetActive(false);
		OnDeactivated?.Invoke();
		OnAnyDeactivated?.Invoke();
	}
	
	public void Activate() {
		activated = true;
		gameObject.SetActive(true);
		OnActivated?.Invoke();
		OnAnyActivated?.Invoke();
	}

	protected virtual void Activated() { }
	protected virtual void Deactivated() { }

}
