using System;
using UnityEngine;
using UnityEngine.UI;

public class scr_character : MonoBehaviour
{
    public scrobj_character characterSprites;

    Image charSprite;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        charSprite = GetComponent<Image>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void ChangeSprite(string emotion)
    {
        charSprite.sprite = (Sprite)characterSprites.GetType().GetField(emotion).GetValue(this);
    }
}