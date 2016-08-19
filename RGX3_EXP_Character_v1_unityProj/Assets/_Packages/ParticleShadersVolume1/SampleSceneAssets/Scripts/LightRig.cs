using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class LightRig : MonoBehaviour {
	public Slider red = null;
	public Slider green = null;
	public Slider blue = null;
	public Slider intensity = null;
	public float rotSens = 20f;

	private Color defaultCol = Color.white;
	private float defaultIntensity = 0.0f;
	private Quaternion defaultRot;

	private GameObject dirLight = null;
	void Start() {
		dirLight = GameObject.Find("Directional1");
		defaultCol = new Color (red.value, green.value, blue.value);
		defaultIntensity = intensity.value;
		defaultRot = transform.rotation;
	}

	void Update () {
		if (red != null) {
			Color lColor = dirLight.GetComponent<Light>().color;
			lColor.r = red.value;
			dirLight.GetComponent<Light>().color = lColor;
		}
		
		if (green != null) {
			Color lColor = dirLight.GetComponent<Light>().color;
			lColor.g = green.value;
			dirLight.GetComponent<Light>().color = lColor;
		}
		
		if (blue != null) {
			Color lColor = dirLight.GetComponent<Light>().color;
			lColor.b = blue.value;
			dirLight.GetComponent<Light>().color = lColor;
		}

		if (intensity != null) {
			dirLight.GetComponent<Light>().intensity = intensity.value;
		}

		if (CheckGUI())
		{
			transform.Rotate(Vector3.up * Input.GetAxis("Mouse X") * rotSens, Space.World);
			transform.Rotate(Vector3.left * Input.GetAxis("Mouse Y") * rotSens, Space.Self);
		}

		dirLight.GetComponent<Light>().intensity = Mathf.Clamp(dirLight.GetComponent<Light>().intensity, 0, 2);
	}

	private bool CheckGUI()
	{
		bool canClick = false;
		if(Input.GetMouseButton(2))
		{
			PointerEventData pointer = new PointerEventData(EventSystem.current);
			pointer.position = Input.mousePosition;
			
			List<RaycastResult> raycastResults = new List<RaycastResult>();
			EventSystem.current.RaycastAll(pointer, raycastResults);
			
			if(raycastResults.Count > 0)
			{
				if(raycastResults[0].gameObject.layer == 5)
					canClick = false;
				else
					canClick = true;
			}
			else
				canClick = true;
		}
		return canClick;
	}

	public void ResetLight()
	{
		if (dirLight)
		{
			dirLight.GetComponent<Light>().color = defaultCol;
			dirLight.GetComponent<Light>().intensity = defaultIntensity;

			red.value = defaultCol.r;
			green.value = defaultCol.g;
			blue.value = defaultCol.b;
			intensity.value = defaultIntensity;
		}
	}

	public void ResetTransform()
	{
		transform.rotation = defaultRot;
	}
}
