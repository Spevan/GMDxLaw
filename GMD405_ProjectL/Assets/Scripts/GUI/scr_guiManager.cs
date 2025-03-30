using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class scr_guiManager : MonoBehaviour
{
    public static scr_guiManager instance {  get; private set; }

    public int FavorableNum;
    public scr_favorabilityBar favorabilityBar;

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    private void Start()
    {
        if (scr_dataPersistenceManager.instance.playerData.Favorability != FavorableNum)
        {
            FavorableNum = scr_dataPersistenceManager.instance.playerData.Favorability;
            favorabilityBar.ChangeMarkerPos(FavorableNum);
        }
    }

    public void ChangeFavorability(int num)
    {
        FavorableNum += num;
        favorabilityBar.ChangeMarkerPos(num);
    }

    public void SaveGame()
    {
        scr_dataPersistenceManager.instance.SaveGame();
    }
}
