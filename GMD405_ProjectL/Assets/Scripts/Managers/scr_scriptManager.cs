using Ink.Parsed;
using UnityEngine;
using System.Collections.Generic;

public class scr_scriptManager : MonoBehaviour
{
    public List<TextAsset> Scripts;

    public TextAsset SetScript(string ScriptName)
    {
        foreach (var script in Scripts)
        {
            if(script.name == ScriptName)
            {
                Debug.Log("Script changed to " + ScriptName);
                return script;
            }
        }
        Debug.Log("Could not find script " +  ScriptName);
        return null;
    }
}
