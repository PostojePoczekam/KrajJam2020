using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class UIManager : MonoBehaviour {

	public PauseMenu pauseMenu;
	public MainMenu mainMenu;

	public GameObject bgc;

	public bool anyPanelActivated => new List<UIPanelBase> {pauseMenu, mainMenu}.Any(x => x.activated);

	private void Awake() {
		UIPanelBase.OnAnyActivated += CheckPause;
		UIPanelBase.OnAnyDeactivated += CheckPause;

		pauseMenu.Deactivate();
		mainMenu.Activate();
	}

	private void CheckPause() {
		Time.timeScale = anyPanelActivated ? 0f : 1f;
		bgc.SetActive(anyPanelActivated);
	}

	private void Update() {
		if (!Input.GetKeyDown(KeyCode.Escape)) return;

		if (pauseMenu.activated) pauseMenu.Deactivate();

		if (!anyPanelActivated) pauseMenu.Activate();
	}
}
