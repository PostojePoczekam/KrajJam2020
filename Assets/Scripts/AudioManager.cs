using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour {

	public AudioSource muzaKevina;
	public AudioSource applause;
	public AudioSource onpickup;
	public AudioSource onDrop;
	public AudioSource onFixed;

	private void Start() {
		
		muzaKevina.playOnAwake = true;
		muzaKevina.Play();

		Arm.OnFixed += () => { onFixed.Play();};
		InteractionHand.OnGrab += () => onpickup.Play();
		ScrapCollector.OnAnyScrapCollected += () => applause.Play();
	}
}
