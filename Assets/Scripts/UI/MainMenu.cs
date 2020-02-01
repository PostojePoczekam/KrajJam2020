using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MainMenu : UIPanelBase {

	public Button startGameBtn;
	public Button quitGameBtn;

	public bool activated { get; private set; }

	private void Awake() {
		Activate();
		startGameBtn.onClick.AddListener(StartGame);
		quitGameBtn.onClick.AddListener(QuitGame);
	}

	private void StartGame() {
		Deactivate();
	}

	private void QuitGame() {
		Application.Quit();
	}
}
