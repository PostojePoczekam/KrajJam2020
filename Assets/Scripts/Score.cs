using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Score : MonoBehaviour {
	public int Points { get; private set; }

	private void Awake() {
		Points = 0;
		FindObjectOfType<ScrapCollector>().OnScrapCollected += EarnPoints;
	}

	private void EarnPoints() => Points += 10;


}