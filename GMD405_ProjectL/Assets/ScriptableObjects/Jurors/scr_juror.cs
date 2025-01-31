using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Juror", menuName = "Juror")]
public class scr_juror : ScriptableObject
{
    public new string name;
    public string birthdate, address;
    public char sex;
    public List<scr_jurorQA> Answers;
}
