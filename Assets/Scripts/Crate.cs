using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Crate : Fixable {

    private int _grabCount;

    public override void GrabThis(InteractionHand hand) {
        base.GrabThis(hand);
        _grabCount++;
        if (_grabCount == 2) ;

    }

    protected override void ReleaseThis(InteractionHand hand) {
        base.ReleaseThis(hand);
    }
}