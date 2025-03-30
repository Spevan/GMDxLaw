using System.Collections;
using System.Collections.Generic;
using System.Threading;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class scr_juryManager : MonoBehaviour
{
    public List<scrobj_juror> jurors = new List<scrobj_juror>(); //List of all jurors
    public List<scrobj_juror> selectedJurors; //List of selected jurors
    public List<GameObject> JurorText = new List<GameObject>(); //List of juror text objs
    int currentJuror; //Index of the selected juror of all jurors

    public TextMeshProUGUI[] GUIText; //List of GUI text objs to manage
    public GameObject selectedJurorTab, selectedJurorPrefab, confirmJuryBtn; //selected juror obj to manage, and to create
    public TextAsset JSONfile;
    // Start is called before the first frame update
    void Start()
    {
        SceneManager.LoadScene("sce_gui", LoadSceneMode.Additive); //Load GUI scene that contains the favorability bar

        currentJuror = 0; //set current juror to 0
        ChangeJuror(currentJuror); //Change juror function
    }

    private void Update()
    {
        if (selectedJurors != scr_dataPersistenceManager.instance.playerData.Jurors && 
            scr_guiManager.instance != null && scr_dataPersistenceManager.instance.playerData.Jurors != null)
        {
            Debug.Log("Searching saved jurors");
            //selectedJurors = scr_dataPersistenceManager.instance.playerData.Jurors;

            //int count = 0;
            foreach (scrobj_juror savedJuror in scr_dataPersistenceManager.instance.playerData.Jurors)
            {
                for (int i = jurors.Count - 1; i >= 0; i--)
                {
                    //count++;
                    if(savedJuror == jurors[i])
                    {
                        currentJuror = i;
                        RemoveJuror(true);
                    }
                }
            }
        }
    }

    public void NextJuror() //Change to the next juror in the total juror list
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

    public void LastJuror() //Change to the last juror in the total juror list
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

    void ChangeJuror(int jurorNum) //Take the int passed and set TXT on the main page to that index in the total juror list
    {
        Debug.Log(jurorNum); //Output to the Console
        GUIText[0].text = jurors[jurorNum].name; //Set 1st guiTXT obj to name
        GUIText[1].text = jurors[jurorNum].birthdate; //Set 2nd guiTXT to bdate
        GUIText[2].text = jurors[jurorNum].sex.ToString(); //3rd guiTXT to gender
        GUIText[3].text = jurors[jurorNum].address; //4th guiTxT to address

        GUIText[4].text = jurors[jurorNum].Answers[0].question; //5th guiTXT to 1st question
        GUIText[5].text = jurors[jurorNum].Answers[0].answer; //6th guiTXT to 1st answer
        GUIText[6].text = jurors[jurorNum].Answers[1].question; //7th guiTXT to 2nd question
        GUIText[7].text = jurors[jurorNum].Answers[1].answer; //8th guiTXT to 2nd answer
    }

    public void RemoveJuror(bool fromSave)
    {
        if (selectedJurors.Count < 12)
        {
            int pointTotal = 0;
            for (int i = 0; i < jurors[currentJuror].Answers.Count - 1; i++)
            {
                pointTotal += jurors[currentJuror].Answers[i].points;
            }

            if(!fromSave)
            {
                scr_guiManager.instance.ChangeFavorability(pointTotal);
            }
            CreateSelectedJuror(currentJuror);
            jurors.RemoveAt(currentJuror);
            NextJuror();
        }
        
        if (selectedJurors.Count >= 12)
        {
            confirmJuryBtn.SetActive(true);
        }
    }

    public void CreateSelectedJuror(int currentJuror)
    {
        selectedJurors.Add(jurors[currentJuror]);
        JurorText.Add(
            Instantiate(selectedJurorPrefab, 
                (selectedJurorTab.transform.position + new Vector3(0, (-25 + (-25 * (selectedJurors.Count)) * selectedJurorTab.transform.parent.GetComponent<Canvas>().scaleFactor), 0)),
                    Quaternion.identity, selectedJurorTab.transform));
        JurorText[JurorText.Count - 1].GetComponent<scr_jurorHover>().GetJurorData(jurors[currentJuror]);
        scr_dataPersistenceManager.instance.playerData.Jurors = selectedJurors;
    }
}
