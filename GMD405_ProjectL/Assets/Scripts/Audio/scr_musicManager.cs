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

    public void PlayMusic(AudioClip clip)
    {
        musicSource.clip = clip;
        musicSource.Play();
    }
}
