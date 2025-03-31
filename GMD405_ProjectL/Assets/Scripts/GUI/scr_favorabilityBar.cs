using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class scr_favorabilityBar : MonoBehaviour
{
    public GameObject favorMarker;
    public PlayerData playerData;
    public List<AudioClip> clipList;

    private void Awake()
    {
        playerData = scr_dataPersistenceManager.instance.playerData;
    }


    public void ChangeMarkerPos(int num)
    {
        favorMarker.transform.Translate(new Vector3(num, 0, 0));
        playerData.Favorability += num;
        if (SceneManager.GetActiveScene().name != "sce_jurorSelect")
        {
            if (playerData.Favorability > 50)
            {
                scr_musicManager.instance.musicClip = clipList[0];
                scr_musicManager.instance.PlayMusic(clipList[0]);
            }
            else if (playerData.Favorability < -50)
            {
                scr_musicManager.instance.musicClip = clipList[1];
                scr_musicManager.instance.PlayMusic(clipList[1]);
            }
            else
            {
                scr_musicManager.instance.musicClip = clipList[2];
                scr_musicManager.instance.PlayMusic(clipList[2]);
            }
        }
        else if(scr_musicManager.instance == null)
        {
            ChangeMarkerPos(0);
            Debug.Log("check");
        }
    }
}
