using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "jurorQA", menuName = "Scriptable Objects/jurorQA")]
public class scrobj_jurorQA : ScriptableObject
{
    public string question, answer;
    public int points;
}
