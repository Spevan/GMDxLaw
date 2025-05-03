using Ink.Parsed;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class scr_characterManager : MonoBehaviour
{
    public List<GameObject> Characters, CharsInScene, CharSpawns;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void AddCharacter(string charName, string emotion)
    {
        foreach(var character in Characters)
        {
            if (character.name == charName && CharsInScene.Count <= 2)
            {
                switch (CharsInScene.Count)
                {
                    default:
                    case 0:
                    {
                        CharsInScene.Add(
                            Instantiate(character, CharSpawns[0].transform.position,
                                Quaternion.identity, this.GetComponentInParent<Transform>()));
                        break;
                    }
                    case 1:
                    {
                        CharsInScene.Add(
                            Instantiate(character, CharSpawns[1].transform.position,
                            Quaternion.identity, this.GetComponentInParent<Transform>()));
                        break;
                    }
                    case 2:
                    {
                        CharsInScene.Add(
                            Instantiate(character, CharSpawns[2].transform.position,
                            Quaternion.identity, this.GetComponentInParent<Transform>()));
                        break;
                    }
                }
                ChangeCharacter(charName, emotion);
            }
        }
    }

    public void ChangeCharacter(string charName, string emotion)
    {
        foreach(var character in CharsInScene)
        {
            if(character.name == charName + "(Clone)")
            {
                character.GetComponent<scr_character>().ChangeSprite(emotion);

            }
        }
    }

    public void RemoveCharacter(string charName)
    {
        foreach(var character in CharsInScene)
        {
            if((character.name) == charName + "(Clone)")
            {
                CharsInScene.Remove(character);
                Destroy(character);
                return;
            }
        }
    }
}
