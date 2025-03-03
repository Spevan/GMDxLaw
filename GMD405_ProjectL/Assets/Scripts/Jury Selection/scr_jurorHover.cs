using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEditor;
using UnityEngine.EventSystems;
using Unity.VisualScripting;

public class scr_jurorHover : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public GameObject MiniGUIprefab, MiniGUI;
    public TextMeshProUGUI[] GUItext;
    public scrobj_juror thisJuror;

    private bool mouse_over = false;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        this.GetComponent<TextMeshProUGUI>().text = thisJuror.name;
    }

    // Update is called once per frame
    void Update()
    {
        if(mouse_over)
        {
            MouseHover();
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        Debug.Log("Mini Juror Stats showing");
        MiniGUI = Instantiate(MiniGUIprefab, this.transform);
        GUItext = MiniGUI.GetComponentsInChildren<TextMeshProUGUI>();
        mouse_over = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        Destroy(MiniGUI);
        mouse_over = false;
    }

    private void MouseHover()
    {
        GUItext[1].text = thisJuror.Answers[0].question; //5th guiTXT to 1st question
        GUItext[2].text = thisJuror.Answers[0].answer; //6th guiTXT to 1st answer
        GUItext[3].text = thisJuror.Answers[0].points.ToString(); //6th guiTXT to 1st answer
        if (thisJuror.Answers[0].points > 0)
        {
            GUItext[3].color = Color.green;
        }
        else
        {
            GUItext[3].color = Color.red;
        }

        GUItext[4].text = thisJuror.Answers[1].question; //7th guiTXT to 2nd question
        GUItext[5].text = thisJuror.Answers[1].answer; //8th guiTXT to 2nd answer
        GUItext[6].text = thisJuror.Answers[1].points.ToString(); //8th guiTXT to 2nd answer
        if (thisJuror.Answers[1].points > 0)
        {
            GUItext[6].color = Color.green;
        }
        else
        {
            GUItext[6].color = Color.red;
        }


        if (Input.mousePosition.y > 150)
        {
            MiniGUI.transform.position = Input.mousePosition + new Vector3(75, -75, -75);
        }
        else
        {
            MiniGUI.transform.position = Input.mousePosition + new Vector3(75, 75, -75);
        }
    }

    public void GetJurorData(scrobj_juror jurorData)
    {
        thisJuror = jurorData;
    }
}
