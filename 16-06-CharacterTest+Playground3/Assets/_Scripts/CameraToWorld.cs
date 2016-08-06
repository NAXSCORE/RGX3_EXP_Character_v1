using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Camera))]
public class CameraToWorld : MonoBehaviour {

	private Camera myCamera;
	// Use this for initialization
	void Start () {
		myCamera = GetComponent<Camera> ();
	}
	
	// Update is called once per frame
	void OnPreCull () {
		Shader.SetGlobalMatrix ("_Camera2World", myCamera.cameraToWorldMatrix);
	}
}
