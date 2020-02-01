using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PauseMenu : UIPanelBase {

	public Button resumeGameBtn;
	public Button mainMenuBtn;

	public MainMenu m_MainMenu;

	protected override void Deactivated() { }

	protected override void Activated() { }

	private void Awake() {
		Deactivate();		
		resumeGameBtn.onClick.AddListener(Deactivate);
		mainMenuBtn.onClick.AddListener(GotoMainMenu);
	}

	private void GotoMainMenu() {
		Deactivate();
		m_MainMenu.Activate();
	}
}
