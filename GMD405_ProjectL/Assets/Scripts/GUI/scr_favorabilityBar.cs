using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class scr_favorabilityBar : MonoBehaviour
{
    public GameObject favorMarker;

    public void ChangeMarkerPos(int num)
    {
        favorMarker.transform.Translate(new Vector3(num, 0, 0));
    }
}
