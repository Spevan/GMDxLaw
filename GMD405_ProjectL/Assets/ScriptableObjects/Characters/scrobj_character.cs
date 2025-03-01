using Ink.Parsed;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

[CreateAssetMenu(fileName = "character", menuName = "Scriptable Objects/character")]
public class scrobj_character : ScriptableObject
{
    public List<scrobj_emotion> emotions;
}
