using System;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class scr_character : MonoBehaviour
{
    public scrobj_character characterSprites;

    public Image charSprite;

    public void ChangeSprite(string emotion)
    {
        foreach(scrobj_emotion emotions in characterSprites.emotions)
        {
            if(emotions.Name == emotion)
            {
                Debug.Log("Emotion changed to " + emotion);
                charSprite.sprite = emotions.Emotion;
            }
        }
    }
}