using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;

public class Guide : MonoBehaviour
{
	[SerializeField] private List<RectTransform> _tiles = new List<RectTransform>();


	private ScrapCollector _collector;
	private float _timer = 0f;

	private void Awake()
	{
		_collector = FindObjectOfType<ScrapCollector>();
		_collector.OnPromote += Promote;
		Promote(0);
	}

	private void Promote(int index)
	{
		for (int i = 0; i < _tiles.Count; i++)
			ToggleTile(i, i == index);
	}

	void ToggleTile(int index, bool enabled)
	{
		_tiles[index].gameObject.SetActive(enabled);
	}
}
