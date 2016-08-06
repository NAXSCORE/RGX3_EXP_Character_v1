using UnityEngine;
using System.Collections;
using Leap.Unity;

public class AutoRigHand : MonoBehaviour {
    public RiggedHand handModel;
    public Vector3 fingerPointing = Vector3.forward;
    public Vector3 palmFacing = Vector3.down;
    
    /// <summary>
    /// Find fingers as children of this hand and set the appropriate parameters in the SkeletalHand
    /// </summary>
    public void FindFingers()
    {
        if (handModel != null)
        {
            //search each child transform to see if they're a finger, and set them up accordingly
            for (int i = 0; i < transform.childCount; i++)
            {
                Transform child = transform.GetChild(i);

                if(child.name.ToLower().Contains("thumb"))
                {
                    handModel.fingers[0] = BuildFinger(child, Leap.Finger.FingerType.TYPE_THUMB);
                }
                if(child.name.ToLower().Contains("index"))
                {
                    handModel.fingers[1] = BuildFinger(child, Leap.Finger.FingerType.TYPE_INDEX);
                }
                if (child.name.ToLower().Contains("middle"))
                {
                    handModel.fingers[2] = BuildFinger(child, Leap.Finger.FingerType.TYPE_MIDDLE);
                }
                if (child.name.ToLower().Contains("ring"))
                {
                    handModel.fingers[3] = BuildFinger(child, Leap.Finger.FingerType.TYPE_RING);
                }
                if (child.name.ToLower().Contains("pinky") || child.name.ToLower().Contains("little"))
                {
                    handModel.fingers[4] = BuildFinger(child, Leap.Finger.FingerType.TYPE_PINKY);
                }
            }
        }
        if (handModel.palm == null)
            handModel.palm = this.transform;
    }

    /// <summary>
    /// Tries to build a Leap Motion finger component on the given transform
    /// If one is already there it uses that, otherwise it makes a new one.
    /// </summary>
    /// <param name="child"></param>
    /// <returns>FingerModel</returns>
    protected FingerModel BuildFinger(Transform child, Leap.Finger.FingerType type)
    {
        RiggedFinger finger = child.GetComponent<RiggedFinger>();
        if (finger == null)
        {
            finger = child.gameObject.AddComponent<RiggedFinger>();
            //set up the finger
            finger.fingerType = type;
            finger.modelFingerPointing = fingerPointing;
            finger.modelPalmFacing = palmFacing;

            finger.bones[1] = child;
            finger.bones[2] = child.GetChild(0);
            finger.bones[3] = child.GetChild(0).GetChild(0);
        }

        //if it's a left thumb change the palm facing
        if(finger.fingerType == Leap.Finger.FingerType.TYPE_THUMB && handModel.Handedness == Chirality.Left)
        {
            finger.modelPalmFacing = new Vector3(-1, 0, 0);
        }
        //if it's a right thumb change the palm facing
        if (finger.fingerType == Leap.Finger.FingerType.TYPE_THUMB && handModel.Handedness == Chirality.Right)
        {
            finger.modelPalmFacing = new Vector3(1, 0, 0);
        }
        return finger;
    }

    /// <summary>
    /// Delete all the RiggedFinger components from the children
    /// </summary>
    public void UnmapFingers()
    {
        if (handModel != null)
        {
            //search each child transform to see if they're a finger, and set them up accordingly
            for (int i = 0; i < transform.childCount; i++)
            {
                RiggedFinger finger = transform.GetChild(i).GetComponent<RiggedFinger>();
                if (finger != null)
                {
                    DestroyImmediate(finger);
                }
            }
        }
    }
}
