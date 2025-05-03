using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class scr_musicManager : MonoBehaviour
{
    public static scr_musicManager instance { get; private set; }
    AudioSource musicSource;
    public AudioClip musicClip;

    private void Awake()
    {
        Debug.Log(this.name + " loaded");
        if(instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    private void Start()
    {
        musicSource = GetComponent<AudioSource>();
        PlayMusic(musicClip);
    }

    public virtual void PlayMusic(AudioClip clip)
    {
        musicClip = clip;
        musicSource.clip = clip;
        musicSource.Play();
    }
}
