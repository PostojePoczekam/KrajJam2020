using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class Scoreboard : MonoBehaviour
{
	[SerializeField] private AnimationCurve _animationCurve;
	[SerializeField] private float _animationSpeed;
	[SerializeField] private TextMeshProUGUI _textMesh;

	private float _timer = 0f;
	private int _points = 0;

	private void Update()
	{
		_timer += Time.deltaTime;
		_timer = Mathf.Clamp01(_timer);
		transform.localScale = Vector3.one + Vector3.one * _animationCurve.Evaluate(_timer);
	}

	private void Awake()
	{
		FindObjectOfType<ScrapCollector>().OnScrapCollected += EarnPoints;
	}

	private void EarnPoints()
	{
		_timer = 0;
		_points += 10;
		_textMesh.text = _points.ToString();
	}
}
