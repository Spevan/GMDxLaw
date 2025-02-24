using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Juror", menuName = "Scriptable Objects/Juror")]
public class scrobj_juror : ScriptableObject
{
    public new string name;
    public string birthdate, address;
    public char sex;
    public List<scrobj_jurorQA> Answers;
}
