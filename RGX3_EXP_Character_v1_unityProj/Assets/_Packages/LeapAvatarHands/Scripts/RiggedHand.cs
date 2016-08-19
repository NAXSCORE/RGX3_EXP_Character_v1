/******************************************************************************\
* Copyright (C) Leap Motion, Inc. 2011-2014.                                   *
* Leap Motion proprietary. Licensed under Apache 2.0                           *
* Available at http://www.apache.org/licenses/LICENSE-2.0.html                 *
\******************************************************************************/

//NOTE: RiggedHand was removed from Leap Motion Orion Core Assets as of 4.1.0, so I have
//added it into the Leap Avatar Hands package.

using UnityEngine;
using System.Collections;
using Leap;

namespace Leap.Unity
{
    // Class to setup a rigged hand based on a model.
    public class RiggedHand : HandModel
    {
        public override ModelType HandModelType
        {
            get
            {
                return ModelType.Graphics;
            }
        }
        public Vector3 modelFingerPointing = Vector3.down;
        public Vector3 modelPalmFacing = Vector3.forward;
        public float wristOffset = -0.04f;

        public override void InitHand()
        {
            UpdateHand();
        }

        //NOTE: SO THEY CHANGED FROM Basis Matrix to Basis LeapTransform
        //THIS CHANGES THE OLD REORIENTATION CALCULATION
        public Quaternion Reorientation()
        {
            return Quaternion.Inverse(Quaternion.LookRotation(modelFingerPointing, -modelPalmFacing));
        }

        /// <summary>
        /// turn off the silly ExecuteInEditMode Update() that happens in IHandModel.
        /// </summary>
#if UNITY_EDITOR
        void Update()
        {

        }
#endif

        public override void UpdateHand()
        {
            if (palm != null)
            {
                palm.position = GetPalmPosition() + (wristOffset * GetArmDirection());
                palm.rotation = GetPalmRotation() * Reorientation();
            }

            if (forearm != null)
                forearm.rotation = GetArmRotation() * Reorientation();

            for (int i = 0; i < fingers.Length; ++i)
            {
                if (fingers[i] != null)
                {
                    fingers[i].fingerType = (Finger.FingerType)i;
                    fingers[i].UpdateFinger();
                }
            }
        }
    }
}
