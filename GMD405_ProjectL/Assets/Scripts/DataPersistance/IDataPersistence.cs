using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IDataPersistence
{
    void LoadData(PlayerData gameData);

    void SaveData(ref PlayerData data);
}