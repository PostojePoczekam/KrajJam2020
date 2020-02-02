using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour {

	private AudioSource _audioSource;

	private void Start() {
		_audioSource = GetComponent<AudioSource>();
		_audioSource.playOnAwake = true;
		_audioSource.Play();
	}
	
	

}
