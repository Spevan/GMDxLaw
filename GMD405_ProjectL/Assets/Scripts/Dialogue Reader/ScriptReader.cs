using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class ScriptReader : MonoBehaviour
{
    public static ScriptReader instance;
    public PlayerData playerData;
    public scr_scriptManager scriptManager;

    [SerializeField]
    public TextAsset _inkJsonFile;
    private Story _StoryScript;

    public GameObject dialogueBox;
    public TMP_Text dialogue;
    public TMP_Text nameTag;
    public bool LOCKED = false;

    public TMP_InputField nameInput;

    [SerializeField]
    private GridLayoutGroup choiceHolder;

    [SerializeField]
    private Button choiceBasePrefab;

    public scr_characterManager characterManager;
    void Awake ()
    {
        if(instance == null)
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
        LoadStory();
        DisplayNextLine();
        playerData = scr_dataPersistenceManager.instance.playerData;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            DisplayNextLine();
        }
    }

    public void SetJSON(TextAsset txtFile)
    {
        _inkJsonFile = txtFile;
    }

    public void SetScript(string scriptName)
    {
        _inkJsonFile = scriptManager.SetScript(scriptName);
        LoadStory();
    }

    void LoadStory()
    {
        _StoryScript = new Story(_inkJsonFile.text);

        _StoryScript.BindExternalFunction("Name", (string charName) => ChangeName(charName));
        _StoryScript.BindExternalFunction("ChangeName", (string charName) => ChangeName(charName));
        _StoryScript.BindExternalFunction("SetScript", (string  stringName) => SetScript(stringName));

        _StoryScript.BindExternalFunction("AddChar", (string charName, string emotion) => AddChar(charName, emotion));
        _StoryScript.BindExternalFunction("ChangeEmote", (string charName, string emotion) => ChangeEmote(charName, emotion));
        _StoryScript.BindExternalFunction("RemoveChar", (string charName) => RemoveChar(charName));

        _StoryScript.BindExternalFunction("ToggleTextBox", (bool lockTB) => ToggleTextBox(lockTB));
        _StoryScript.BindExternalFunction("ToggleNameInput", () => ToggleNameInput());
        _StoryScript.BindExternalFunction("GetName", () => GetName());
        _StoryScript.BindExternalFunction("ChangeFavorability", (int num) => ChangeFavorability(num));

        _StoryScript.BindExternalFunction("ChangeScene", (string sceneName) => ChangeScene(sceneName));
        _StoryScript.BindExternalFunction("PlaySFX", (string clipName) => PlaySFX(clipName));
        _StoryScript.BindExternalFunction("GetEnding", () => GetEnding());
    }

    public void DisplayNextLine()
    {
        if (!LOCKED)
        {
            if (_StoryScript.canContinue)
            {
                //checking if there is content to go through
                string text = _StoryScript.Continue(); //Gets Next Line
                text = text?.Trim(); //Removes White space from the Text
                dialogue.text = text; //display new text
                if (_StoryScript.currentChoices.Count > 0)
                {
                    DisplayChoices();
                }
            }
            else
            {
                dialogueBox.gameObject.SetActive(false); //Displays when text is over 
            }
        }
    }

    private void DisplayChoices()
    {
        //checks if button holder has buttons in it
        if (choiceHolder.GetComponentsInChildren<Button>().Length > 0) return; 

        for (int i = 0; i<_StoryScript.currentChoices.Count; i++)
        {
            var choice = _StoryScript.currentChoices[i];
            var button = CreateChoiceButton(choice.text); //creates a choice button

            button.onClick.AddListener(() => OnClickChoiceButton(choice));
        }
    }

    Button CreateChoiceButton(string text)
    {

        //Instantiate Button Prefab
        var choiceButton = Instantiate(choiceBasePrefab);
        choiceButton.transform.SetParent(choiceHolder.transform, false);

        //Change text in Button Prefab
        var buttonText = choiceButton.GetComponentInChildren<TMP_Text>();
        buttonText.text = text;

        return choiceButton;
    }

    void OnClickChoiceButton (Choice choice)
    {
        _StoryScript.ChooseChoiceIndex(choice.index);
        RefreshChoiceView();
        DisplayNextLine();
        DisplayNextLine();
    }

    void RefreshChoiceView()
    {
        if(choiceHolder != null)
        {
            foreach(var button in choiceHolder.GetComponentsInChildren<Button>())
            {
                Destroy(button.gameObject);
            }
        }
    }

    public void ChangeName(string name)
    {

        string SpeakerName = name;

        nameTag.text = SpeakerName;

    }

    public void AddChar(string charName, string emotion)
    {
        characterManager.AddCharacter(charName, emotion);
    }

    public void ChangeEmote(string charName, string emotion)
    {
        characterManager.ChangeCharacter(charName, emotion);
    }

    public void RemoveChar(string charName)
    {
        characterManager.RemoveCharacter(charName);
    }

    public void ChangeScene(string sceneName)
    {
        scr_sceneManager.instance.ChangeScene(sceneName);
    }

    public void ToggleNameInput()
    {
        if(nameInput.gameObject.activeSelf)
        {
            nameInput.gameObject.SetActive(false);
            LOCKED = false;
        }
        else
        {
            nameInput.gameObject.SetActive(true);
            LOCKED = true;
        }
    }

    public void ToggleTextBox(bool lockTB)
    {
        if(dialogueBox.activeSelf)
        {
            dialogueBox.SetActive(false);
            if (lockTB)
            {
                LOCKED = true;
            }
            else
            {
                LOCKED = false; 
            }
        }
        else
        {
            dialogueBox.SetActive(true);
            LOCKED = false;
        }    
    }

    public void SetName()
    {
        playerData.Name = nameInput.text;
        ToggleNameInput();
        DisplayNextLine();
    }

    public string GetName()
    {
        return playerData.Name;
    }

    public void SetLineNum()
    {
        int lineNum = _StoryScript.currentText.Length;
        playerData.ScriptLineNum = lineNum;
    }

    public void ChangeFavorability(int num)
    {
        scr_guiManager.instance.ChangeFavorability(num);
    }

    public void PlaySFX(string clipName)
    {
        scr_sfxManager.instance.PlaySFX(clipName);
    }

    public void GetEnding()
    {
        if (scr_guiManager.instance.FavorableNum >= 0)
        {
            ChangeScene("sce_win");
        }
        else
        {
            ChangeScene("sce_lose");
        }
    }
}
