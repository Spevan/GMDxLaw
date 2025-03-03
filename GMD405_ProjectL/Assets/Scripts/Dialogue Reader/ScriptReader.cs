using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class ScriptReader : MonoBehaviour
{
    [SerializeField]
    public TextAsset _inkJsonFile;
    private Story _StoryScript;

    public TMP_Text dialogueBox;
    public TMP_Text nameTag;

    [SerializeField]
    private GridLayoutGroup choiceHolder;

    [SerializeField]
    private Button choiceBasePrefab;

    public scr_characterManager characterManager;
    void Start ()
    {
        LoadStory();
        DisplayNextLine();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            DisplayNextLine();
        }
    }

    void LoadStory()
    {


        _StoryScript = new Story(_inkJsonFile.text);

        _StoryScript.BindExternalFunction("Name", (string charName) => ChangeName(charName));
        _StoryScript.BindExternalFunction("ChangeName", (string charName) => ChangeName(charName));

        _StoryScript.BindExternalFunction("AddChar", (string charName) => AddChar(charName));
        _StoryScript.BindExternalFunction("ChangeEmote", (string charName, string emotion) => ChangeEmote(charName, emotion));
        _StoryScript.BindExternalFunction("RemoveChar", (string charName) => RemoveChar(charName));

        _StoryScript.BindExternalFunction("ChangeScene", (string sceneName) => ChangeScene(sceneName));
    }

    public void DisplayNextLine()
    {

        if (_StoryScript.canContinue)
        {
            //checking if there is content to go through
            string text = _StoryScript.Continue(); //Gets Next Line
            text = text?.Trim(); //Removes White space from the Text
            dialogueBox.text = text; //display new text
        }
        else if (_StoryScript.currentChoices.Count > 0)
        {
            DisplayChoices();
            
        }
        else
        {
            dialogueBox.gameObject.SetActive(false); //Displays when text is over 
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

    public void AddChar(string charName)
    {
        characterManager.AddCharacter(charName);
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
}
