using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "jurorQA", menuName = "jurorQA")]
public class scr_jurorQA : ScriptableObject
{
    public string question, answer;
    public int points;
}
