using JetBrains.Annotations;
using System.Collections.Generic;
using UnityEngine;

public class scr_playSFX : MonoBehaviour
{
    public List<AudioClip> SFX;
    scr_sfxManager sfxManager;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void PlayClip()
    {
        if(sfxManager == null)
        {
            sfxManager = scr_sfxManager.instance;
        }

        int i = Random.Range(0, SFX.Count);
        sfxManager.PlaySFX(SFX[i]);
    }
}
