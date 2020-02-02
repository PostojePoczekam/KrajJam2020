using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TableParticleSpawner : MonoBehaviour {

    public ParticleSystem dropParticles;
    
    private void OnCollisionEnter(Collision other) {
        if (other.collider.GetComponent<Interactable>() == null) return;

        var newPart = Instantiate(dropParticles);
        newPart.gameObject.SetActive(true);
        newPart.transform.position = other.contacts[0].point;
        newPart.Play();
        Destroy(newPart, 2f);
    }
}
