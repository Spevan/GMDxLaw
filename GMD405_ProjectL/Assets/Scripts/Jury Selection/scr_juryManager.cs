using System.Collections;
using System.Collections.Generic;
using System.Threading;
using TMPro;
using UnityEditor.SearchService;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class scr_juryManager : MonoBehaviour
{
    public List<scrobj_juror> jurors = new List<scrobj_juror>();
    int currentJuror;

    public TextMeshProUGUI[] GUIText;
    // Start is called before the first frame update
    void Start()
    {
        SceneManager.LoadScene("sce_gui", LoadSceneMode.Additive);

        currentJuror = 0;
        ChangeJuror(currentJuror);
    }

    public void NextJuror()
    {
        if(currentJuror >= jurors.Count - 1)
        {
            currentJuror = 0;
        }
        else
        {
            currentJuror++;
        }
        ChangeJuror(currentJuror);
    }

    public void LastJuror()
    {
        if(currentJuror <= 0)
        {
            currentJuror = jurors.Count - 1;
        }
        else
        {
            currentJuror--;
        }
        ChangeJuror(currentJuror);
    }

    void ChangeJuror(int jurorNum)
    {
        Debug.Log(jurorNum);
        GUIText[0].text = jurors[jurorNum].name;
        GUIText[1].text = jurors[jurorNum].birthdate;
        GUIText[2].text = jurors[jurorNum].sex.ToString();
        GUIText[3].text = jurors[jurorNum].address;

        GUIText[4].text = jurors[jurorNum].Answers[0].question;
        GUIText[5].text = jurors[jurorNum].Answers[0].answer;
        GUIText[6].text = jurors[jurorNum].Answers[1].question;
        GUIText[7].text = jurors[jurorNum].Answers[1].answer;
    }

    public void RemoveJuror()
    {
        int pointTotal = 0;
        for(int i = 0; i < jurors[currentJuror].Answers.Count; i++)
        {
            pointTotal += jurors[currentJuror].Answers[i].points;
        }

        scr_guiManager.instance.ChangeFavorability(pointTotal);
        jurors.RemoveAt(currentJuror);
        NextJuror();
    }
}
