using UnityEngine;
using System.Collections.Generic;

public class scr_menuToggle : MonoBehaviour
{
    public List<GameObject> GuiObjs;

    public void Toggle()
    {
        foreach (GameObject obj in GuiObjs)
        {
            if (obj.activeSelf)
            {
                obj.SetActive(false);
            }
            else
            {
                obj.SetActive(true);
            }
        }
    }
}
