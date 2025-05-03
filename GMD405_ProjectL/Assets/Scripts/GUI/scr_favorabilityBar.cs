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

    public void LoadMarkerPos(int num)
    {
        favorMarker.transform.Translate(new Vector3(num, 0, 0));
        playerData.Favorability += num;
    }

    public void ChangeMarkerPos(int num)
    {
        favorMarker.transform.Translate(new Vector3(num, 0, 0));
        playerData.Favorability += num;
        if (scr_musicManager.instance != null && SceneManager.GetActiveScene().name != "sce_jurorSelect")
        {
            if (playerData.Favorability > 25 && !scr_musicManager.instance.musicClip.name.Equals(clipList[0].name))
            {
                scr_musicManager.instance.PlayMusic(clipList[0]);
            }
            else if (playerData.Favorability < -25 && !scr_musicManager.instance.musicClip.name.Equals(clipList[1].name))
            {
                scr_musicManager.instance.PlayMusic(clipList[1]);
            }
            else if (scr_musicManager.instance.musicClip.name != clipList[2].name)
            {
                scr_musicManager.instance.PlayMusic(clipList[2]);
            }
        }
    }
}
