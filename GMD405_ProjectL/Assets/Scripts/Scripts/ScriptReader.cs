using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class ScriptReader : MonoBehaviour
{
    [SerializeField]
    private TextAsset _inkJsonFile;
    private Story _StoryScript;

    public TMP_Text dialogueBox;
    public TMP_Text nameTag;

    void Start ()
    {
        LoadStory();
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
        else
        {
            dialogueBox.text = "thats all folks";
        }
    }

    public void ChangeName(string name)
    {

        string SpeakerName = name;

        nameTag.text = SpeakerName;

    }

}
