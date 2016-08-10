/**
An custom Inspector window that allows you to rig up a Leap Motion skeletal hand rapidly
without so much manual assigning of parameters.

Author: Ivan Bindoff
*/

using UnityEngine;
using System.Collections;
using UnityEditor;
using Leap.Unity;

[CustomEditor(typeof(AutoRigHand))]
[CanEditMultipleObjects]
public class AutoRigHandEditor : Editor {
    SerializedProperty fingerPointing;
    SerializedProperty palmFacing;
    

    AutoRigHand self;
    
    void OnEnable()
    {
        self = target as AutoRigHand;
        self.handModel = self.GetComponent<RiggedHand>();
        if(self.handModel == null)
        {
            Debug.Log("AutoRigHand::OnEnable::" + this.name + "::Couldn't find a RiggedHand component on this object.");
        }

        palmFacing = serializedObject.FindProperty("palmFacing");
        fingerPointing = serializedObject.FindProperty("fingerPointing");
    }


    public override void OnInspectorGUI()
    {
        serializedObject.Update();
        EditorGUILayout.LabelField("Default pointing/facing settings are correct for Mixamo rigged avatars,");
        EditorGUILayout.LabelField("may need to be adjusted for other avatars.");
        EditorGUILayout.LabelField("Thumb generally needs further manual adjustment.");
        EditorGUILayout.PropertyField(fingerPointing);
        EditorGUILayout.PropertyField(palmFacing);
        serializedObject.ApplyModifiedProperties();

        if (GUILayout.Button("Find and Map Fingers"))
        {
            self.FindFingers();
        }
        
        if(GUILayout.Button("Unmap Fingers"))
        {
            self.UnmapFingers();
        }
    }
}
