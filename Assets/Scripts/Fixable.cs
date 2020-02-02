using System.Linq;
using System.Xml;
using UnityEngine;

public class Fixable : Interactable {

	public bool isFixed { get; protected set; } = false;

	void Update() {
		Debug.DrawRay(transform.position, Vector3.up, Color.cyan, 2f);
	}

	protected bool IsInBlowtorchRange() {
		var colls = Physics.OverlapSphere(transform.position, 0.1f);
		var xxd = colls.Any(x => x.GetComponent<BlowtorchFlame>() != null);
		
		foreach (var VARIABLE in colls) {
			var xd = VARIABLE.GetComponent<BlowtorchFlame>();
			if (xd != null)
				xxd = true;
		}
		
		if (xxd) {
			Debug.Log($"<color=green>raycast udany</color>");
		} else {
			Debug.Log($"<color=red>raycast nieudany</color>");
		}
		return xxd;
	}

	// private bool IsBlowtorchOK() {
	// 	Debug.DrawRay(transform.position, Vector3.up, Color.cyan, 2f);
	// 	return Physics.OverlapSphere(transform.position, 0.1f).Any(x => GetComponent<BlowtorchFlame>() != null);
	// }
}
