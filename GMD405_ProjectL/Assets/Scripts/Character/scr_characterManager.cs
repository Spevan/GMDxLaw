using Ink.Parsed;
using System.Collections.Generic;
using UnityEngine;

public class scr_characterManager : MonoBehaviour
{
    public List<GameObject> Characters;
    public List<GameObject> CharsInScene;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void AddCharacter(string charName)
    {
        foreach(var character in Characters)
        {
            if(character.name == charName)
            {
                Instantiate(character, new Vector2(Screen.width / 2, Screen.height / 2), Quaternion.identity, this.GetComponentInParent<Transform>());
            }
        }
    }

    public void ChangeCharacter(string charName, string emotion)
    {
        foreach(var character in CharsInScene)
        {
            if(character.name == charName)
            {
                character.GetComponent<scr_character>().ChangeSprite(emotion);

            }
        }
    }

    public void RemoveCharacter(string charName)
    {
        foreach(var character in CharsInScene)
        {
            if(character.name == charName)
            {
                Destroy(character);
            }
        }
    }
}
