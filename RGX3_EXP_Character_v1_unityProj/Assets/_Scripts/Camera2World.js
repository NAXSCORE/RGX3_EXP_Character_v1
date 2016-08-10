#pragma strict

// Apply this to all of the cameras that will be rendering lit particles.

function OnPreCull () {
	Shader.SetGlobalMatrix ("_Camera2World", this.GetComponent.<Camera>().cameraToWorldMatrix );
}