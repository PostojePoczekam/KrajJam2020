using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour {

	public AudioSource _audioSource;
	public AudioSource applause;
	public AudioSource onpickup;
	public AudioSource onDrop;

	private void Start() {
		
		_audioSource.playOnAwake = true;
		_audioSource.Play();

		Arm.OnFixed += () => { applause.Play();};
		InteractionHand.OnGrab += () => onpickup.Play();
	}
}
