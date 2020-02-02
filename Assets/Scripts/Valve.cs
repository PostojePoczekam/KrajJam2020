using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Valve : Fixable {
    private Transform _hand;
    public override void GrabThis(InteractionHand hand) {
        base.GrabThis(hand);
        hand.GetComponent<FixedJoint>().connectedBody = null;
        _hand = hand.transform;

    }
}
