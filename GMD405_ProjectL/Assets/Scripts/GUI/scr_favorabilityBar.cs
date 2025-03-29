using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class scr_favorabilityBar : MonoBehaviour
{
    public GameObject favorMarker;
    public PlayerData playerData;

    private void Start()
    {
        playerData = scr_dataPersistenceManager.instance.playerData;
    }

    public void ChangeMarkerPos(int num)
    {
        favorMarker.transform.Translate(new Vector3(num, 0, 0));
        playerData.Favorability += num;
    }
}
